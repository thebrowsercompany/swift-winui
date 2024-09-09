function Get-SwiftWinRTVersion {
    $Projections = Get-Content -Path $PSScriptRoot\projections.json | ConvertFrom-Json
    return $Projections."swift-winrt"
}

function Get-PackageString {
    param(
        $Package
    )
    if ($Package) {
        return "  <package id=""$($Package.Id)"" version=""$($Package.Version)"" />`n"
    }
}
function Restore-Nuget {
    param(
        [string]$PackagesDir
    )
    $NugetDownloadPath = Join-Path $env:TEMP "nuget.exe"
    if (-not (Test-Path $NugetDownloadPath)) {
        Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile $NugetDownloadPath
    }

    $Projections = Get-Content -Path $PSScriptRoot\projections.json | ConvertFrom-Json
    $SwiftWinRTVersion = Get-SwiftWinRTVersion
    $PackagesConfigContent = "<?xml version=""1.0"" encoding=""utf-8""?>`n"
    $PackagesConfigContent += "<packages>`n"
    $PackagesConfigContent += "  <package id=""TheBrowserCompany.SwiftWinRT"" version=""$SwiftWinRTVersion"" />`n"
    if ($Projections.Package) {
        $PackagesConfigContent += Get-PackageString -Package $Projections.Package
    }

    $Projections.Packages | ForEach-Object {
        $PackagesConfigContent += Get-PackageString -Package $_
    }
    $Projections.Dependencies | ForEach-Object {
        $PackagesConfigContent += Get-PackageString -Package $_
    }
    $PackagesConfigContent += "</packages>"
    if (-not (Test-Path "$PSScriptRoot\.packages")) {
        New-Item -ItemType Directory -Path "$PSScriptRoot\.packages" | Out-Null
    }
    $PackagesConfigPath = Join-Path $PSScriptRoot ".packages\packages.config"
    $PackagesConfigContent | Out-File -FilePath $PackagesConfigPath -Encoding ascii

    & $NugetDownloadPath restore $PackagesConfigPath -PackagesDirectory $PackagesDir | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Nuget restore failed!" -ForegroundColor Red
        exit 1
    }
}

function Get-WinMDInputs() {
    param(
        $Package
    )
    $Id = $Package.Id
    $Version = $Package.Version
    return Get-ChildItem -Path $PackagesDir\$Id.$Version\ -Filter *.winmd -Recurse
}

function Copy-Project {
    param(
        [string]$OutputLocation,
        [string]$ProjectName
    )

    if ($ProjectName) {
        $ProjectGeneratedDir = if ($ProjectName -eq "CWinRT") { "$ProjectName" } else { "$ProjectName\Generated" }

        $ProjectDir = Join-Path $PSScriptRoot "Sources\$ProjectGeneratedDir"
        if (Test-Path $ProjectDir) {
            Remove-Item -Path $ProjectDir -Recurse -Force
        }
        Copy-Item -Path $OutputLocation\Sources\$ProjectName -Destination $ProjectDir -Recurse -Force
    }
}


function Invoke-SwiftWinRT() {
    param(
        [string]$PackagesDir
    )
    $Projections = Get-Content -Path $PSScriptRoot\projections.json | ConvertFrom-Json

    $SwiftWinRTVersion = Get-SwiftWinRTVersion
    # write generated bindings to a temp directory since swiftwinrt will generate all dependencies and the CWinRT
    $OutputLocation = Join-Path $PSScriptRoot ".generated"
    if (Test-Path $OutputLocation) {
        Remove-Item -Path $OutputLocation -Recurse -Force
    }

    $RspParams = "-output $OutputLocation`n"

    # read projections.json and for each "include" write to -include param. for each "exclude" write to -exclude param
    $Projections.Include | ForEach-Object {
        $RspParams += "-include $_`n"
    }
    $Projections.Exclude | ForEach-Object {
        $RspParams += "-exclude $_`n"
    }

    if ($Projections.Package) {
        Get-WinMDInputs -Package $Package | ForEach-Object {
            $RspParams += "-input $($_.FullName)`n"
        }
    }

    $Projections.Packages | ForEach-Object {
        Get-WinMDInputs -Package $Package | ForEach-Object {
            $RspParams += "-input $($_.FullName)`n"
        }
    }
    $Projections.Dependencies | ForEach-Object {
        Get-WinMDInputs -Package $Package | ForEach-Object {
            $RspParams += "-input $($_.FullName)`n"
        }
    }

    # write rsp params to file
    $RspFile = Join-Path $PSScriptRoot "swift-winrt.rsp"
    $RspParams | Out-File -FilePath $RspFile -Encoding ascii
    & $PackagesDir\TheBrowserCompany.SwiftWinRT.$SwiftWinRTVersion\bin\swiftwinrt.exe "@$RspFile"

    if ($LASTEXITCODE -ne 0) {
        Write-Host "swiftwinrt failed with error code $LASTEXITCODE" -ForegroundColor Red
        exit 1
    }

    $Projections.Projects | ForEach-Object {
        Copy-Project -OutputLocation $OutputLocation -ProjectName $_
    }

    if ($Projections.Project) {
        Copy-Project -OutputLocation $OutputLocation -ProjectName $Projections.Project
    }
}

$PackagesDir = Join-Path $PSScriptRoot ".packages"
Restore-Nuget -PackagesDir $PackagesDir
Invoke-SwiftWinRT -PackagesDir $PackagesDir
Write-Host "SwiftWinRT bindings generated successfully!" -ForegroundColor Green
