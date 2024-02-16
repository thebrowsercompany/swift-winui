# swift-winui
Swift Language Bindings for WinUI

## APIs
These projections contains the WinUI APIs which are part of the Windows App SDK, (i.e. `Microsoft.UI.Xaml.*`). See official documentation for more information on these components:

- [API Docs](https://learn.microsoft.com/en-us/windows/windows-app-sdk/api/winrt/)
- [Official GitHub repo](https://github.com/microsoft/microsoft-ui-xaml)

Due to SPM limitations and the current state of swift-winrt, not all APIs can be generated as this causes export limit issues.

### SDK Versions

1. Windows SDK: `10.0.18362.0`
2. Windows App SDK: `1.5-preview1`

## Project Configuration
The bindings are generated from WinMD files, found in NuGet packages on Nuget.org. There are two key files which drive this:
1. projections.json - this specifies the project/package and which apis to include in the projection
2. generate-bindings.ps1 - this file reads both `packages.config` and `projections.json` and generates the appropriate bindings.

## Filing Issues

Please file any issues you have with this repository on https://github.com/thebrowsercompany/swift-winrt

## Known Issues and Limitations

- Only x64 architecture is supported for now

- The developer experience for consuming WinRT APIs from Swift is a work in progress. Due to current limitations, not all APIs can be generated as this causes export limit issues.

- The APIs listed in projections.json are required for the other `swift-*` projects to build. Modify a projections.json in any one of those projects could require an update here.

## Using WinUI

In order to use WinUI, you need to download the Windows App SDK from here: https://aka.ms/windowsappsdk/1.5/1.5.240205001-preview1/windowsappruntimeinstall-x64.exe