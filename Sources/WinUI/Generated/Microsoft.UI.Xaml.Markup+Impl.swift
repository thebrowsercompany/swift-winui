// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Foundation
@_spi(WinRTInternal) @_spi(WinRTImplements) import WindowsFoundation
import CWinRT

public enum __IMPL_Microsoft_UI_Xaml_Markup {
    public enum IComponentConnectorBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CMarkup_CIComponentConnector
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Markup.IComponentConnector
        public typealias SwiftProjection = AnyIComponentConnector
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IComponentConnectorImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Markup.IComponentConnectorVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IComponentConnectorImpl: IComponentConnector, WinRTAbiImpl {
        fileprivate typealias Bridge = IComponentConnectorBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.icomponentconnector.connect)
        fileprivate func connect(_ connectionId: Int32, _ target: Any!) throws {
            try _default.ConnectImpl(connectionId, target)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.icomponentconnector.getbindingconnector)
        fileprivate func getBindingConnector(_ connectionId: Int32, _ target: Any!) throws -> AnyIComponentConnector! {
            try _default.GetBindingConnectorImpl(connectionId, target)
        }

    }

    public enum IDataTemplateComponentBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CMarkup_CIDataTemplateComponent
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Markup.IDataTemplateComponent
        public typealias SwiftProjection = AnyIDataTemplateComponent
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IDataTemplateComponentImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Markup.IDataTemplateComponentVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IDataTemplateComponentImpl: IDataTemplateComponent, WinRTAbiImpl {
        fileprivate typealias Bridge = IDataTemplateComponentBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.idatatemplatecomponent.recycle)
        fileprivate func recycle() throws {
            try _default.RecycleImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.idatatemplatecomponent.processbindings)
        fileprivate func processBindings(_ item: Any!, _ itemIndex: Int32, _ phase: Int32, _ nextPhase: inout Int32) throws {
            try _default.ProcessBindingsImpl(item, itemIndex, phase, &nextPhase)
        }

    }

    public enum IXamlMemberBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CMarkup_CIXamlMember
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Markup.IXamlMember
        public typealias SwiftProjection = AnyIXamlMember
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IXamlMemberImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Markup.IXamlMemberVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IXamlMemberImpl: IXamlMember, WinRTAbiImpl {
        fileprivate typealias Bridge = IXamlMemberBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.getvalue)
        fileprivate func getValue(_ instance: Any!) throws -> Any! {
            try _default.GetValueImpl(instance)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.setvalue)
        fileprivate func setValue(_ instance: Any!, _ value: Any!) throws {
            try _default.SetValueImpl(instance, value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.isattachable)
        fileprivate var isAttachable : Bool {
            get { try! _default.get_IsAttachableImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.isdependencyproperty)
        fileprivate var isDependencyProperty : Bool {
            get { try! _default.get_IsDependencyPropertyImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.isreadonly)
        fileprivate var isReadOnly : Bool {
            get { try! _default.get_IsReadOnlyImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.name)
        fileprivate var name : String {
            get { try! _default.get_NameImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.targettype)
        fileprivate var targetType : AnyIXamlType! {
            get { try! _default.get_TargetTypeImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmember.type)
        fileprivate var type : AnyIXamlType! {
            get { try! _default.get_TypeImpl() }
        }

    }

    public enum IXamlMetadataProviderBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CMarkup_CIXamlMetadataProvider
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Markup.IXamlMetadataProvider
        public typealias SwiftProjection = AnyIXamlMetadataProvider
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IXamlMetadataProviderImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Markup.IXamlMetadataProviderVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IXamlMetadataProviderImpl: IXamlMetadataProvider, WinRTAbiImpl {
        fileprivate typealias Bridge = IXamlMetadataProviderBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmetadataprovider.getxamltype)
        fileprivate func getXamlType(_ type: WinUI.TypeName) throws -> AnyIXamlType! {
            try _default.GetXamlTypeImpl(type)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamlmetadataprovider.getxamltype)
        fileprivate func getXamlType(_ fullName: String) throws -> AnyIXamlType! {
            try _default.GetXamlTypeByFullNameImpl(fullName)
        }

    }

    public enum IXamlTypeBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CMarkup_CIXamlType
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Markup.IXamlType
        public typealias SwiftProjection = AnyIXamlType
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IXamlTypeImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Markup.IXamlTypeVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IXamlTypeImpl: IXamlType, WinRTAbiImpl {
        fileprivate typealias Bridge = IXamlTypeBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.activateinstance)
        fileprivate func activateInstance() throws -> Any! {
            try _default.ActivateInstanceImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.createfromstring)
        fileprivate func createFromString(_ value: String) throws -> Any! {
            try _default.CreateFromStringImpl(value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.getmember)
        fileprivate func getMember(_ name: String) throws -> AnyIXamlMember! {
            try _default.GetMemberImpl(name)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.addtovector)
        fileprivate func addToVector(_ instance: Any!, _ value: Any!) throws {
            try _default.AddToVectorImpl(instance, value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.addtomap)
        fileprivate func addToMap(_ instance: Any!, _ key: Any!, _ value: Any!) throws {
            try _default.AddToMapImpl(instance, key, value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.runinitializer)
        fileprivate func runInitializer() throws {
            try _default.RunInitializerImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.basetype)
        fileprivate var baseType : AnyIXamlType! {
            get { try! _default.get_BaseTypeImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.boxedtype)
        fileprivate var boxedType : AnyIXamlType! {
            get { try! _default.get_BoxedTypeImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.contentproperty)
        fileprivate var contentProperty : AnyIXamlMember! {
            get { try! _default.get_ContentPropertyImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.fullname)
        fileprivate var fullName : String {
            get { try! _default.get_FullNameImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.isarray)
        fileprivate var isArray : Bool {
            get { try! _default.get_IsArrayImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.isbindable)
        fileprivate var isBindable : Bool {
            get { try! _default.get_IsBindableImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.iscollection)
        fileprivate var isCollection : Bool {
            get { try! _default.get_IsCollectionImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.isconstructible)
        fileprivate var isConstructible : Bool {
            get { try! _default.get_IsConstructibleImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.isdictionary)
        fileprivate var isDictionary : Bool {
            get { try! _default.get_IsDictionaryImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.ismarkupextension)
        fileprivate var isMarkupExtension : Bool {
            get { try! _default.get_IsMarkupExtensionImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.itemtype)
        fileprivate var itemType : AnyIXamlType! {
            get { try! _default.get_ItemTypeImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.keytype)
        fileprivate var keyType : AnyIXamlType! {
            get { try! _default.get_KeyTypeImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.markup.ixamltype.underlyingtype)
        fileprivate var underlyingType : WinUI.TypeName {
            get { try! _default.get_UnderlyingTypeImpl() }
        }

    }

}
