import Foundation
import WinAppSDK
@_spi(WinRTImplements) import WindowsFoundation

/// You should derive from SwiftApplication and mark this class as your @main entry point. This class
/// will ensure that the Windows Runtime is properly initialized and that your WinUI Application
/// is properly configured.
///
/// Example usage:
/// ```
/// import WinUI
///
/// @main
/// class MySwiftApp: SwiftApplication {
///   required init() {
///     super.init()
///   }
///
///  override func onLaunched(_ args: LaunchActivatedEventArgs) {
///    let window = Window()
///    window.content = TextBlock(text: "Hello, world!")
///    window.activate()
///   }
/// ```
open class SwiftApplication: Application, IXamlMetadataProvider {
    public required override init() {
        super.init()
    }

    @_spi(WinRTImplements)
    override public func onLaunched(_ args: LaunchActivatedEventArgs?) {
        resources.mergedDictionaries.append(XamlControlsResources())
        onLaunched(args!)
    }

    /// Override this method to provide your application's main entry point.
    /// The first window for your application should be created and activated here.
    open func onLaunched(_ args: LaunchActivatedEventArgs) {
    }

    /// Override this method to provide any necessary shutdown code.
    open func onShutdown() { }

    public static func main() {
        do {
            try withExtendedLifetime(WindowsAppRuntimeInitializer()) {
                let appClass = String(describing: String(reflecting: Self.self))
                guard let instance = NSClassFromString(appClass) else {
                    fatalError("unable to find application class \(appClass)")
                }
                var application: SwiftApplication!
                Application.start { _ in
                    MainRunLoopTickler.setup()
                    application = (instance as! SwiftApplication.Type).init()
                }
                application.onShutdown()
                MainRunLoopTickler.shutdown()
            }
        }
        catch {
            fatalError("Failed to initialize WindowsAppRuntimeInitializer: \(error)")
        }
    }

    override open func queryInterface(_ iid: WindowsFoundation.IID) -> IUnknownRef? {
        switch iid {
        case __ABI_Microsoft_UI_Xaml_Markup.IXamlMetadataProviderWrapper.IID:
            let ixmp = __ABI_Microsoft_UI_Xaml_Markup.IXamlMetadataProviderWrapper(self)
            return ixmp?.queryInterface(iid)
        default:
            return super.queryInterface(iid)
        }
    }

    private lazy var metadataProvider: XamlControlsXamlMetaDataProvider = .init()
    public func getXamlType(_ type: TypeName) throws -> IXamlType! {
        try metadataProvider.getXamlType(type)
    }

    public func getXamlType(_ fullName: String) throws -> IXamlType! {
        try metadataProvider.getXamlType(fullName)
    }
}
