// WARNING: Please don't edit this file. It was generated by Swift/WinRT v0.0.1
// swiftlint:disable all
import Foundation
@_spi(WinRTInternal) @_spi(WinRTImplements) import WindowsFoundation
import CWinRT

public enum __IMPL_Microsoft_UI_Xaml_Interop {
    public enum IBindableIterableBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CIBindableIterable
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.IBindableIterable
        public typealias SwiftProjection = AnyIBindableIterable
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBindableIterableImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Interop.IBindableIterableVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IBindableIterableImpl: IBindableIterable, WinRTAbiImpl {
        fileprivate typealias Bridge = IBindableIterableBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindableiterable.first)
        fileprivate func first() throws -> AnyIBindableIterator! {
            try _default.FirstImpl()
        }

    }

    public enum IBindableIteratorBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CIBindableIterator
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.IBindableIterator
        public typealias SwiftProjection = AnyIBindableIterator
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBindableIteratorImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Interop.IBindableIteratorVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IBindableIteratorImpl: IBindableIterator, WinRTAbiImpl {
        fileprivate typealias Bridge = IBindableIteratorBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindableiterator.movenext)
        fileprivate func moveNext() throws -> Bool {
            try _default.MoveNextImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindableiterator.current)
        fileprivate var current : Any! {
            get { try! _default.get_CurrentImpl() }
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindableiterator.hascurrent)
        fileprivate var hasCurrent : Bool {
            get { try! _default.get_HasCurrentImpl() }
        }

    }

    public enum IBindableVectorBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CIBindableVector
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.IBindableVector
        public typealias SwiftProjection = AnyIBindableVector
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBindableVectorImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Interop.IBindableVectorVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IBindableVectorImpl: IBindableVector, WinRTAbiImpl {
        fileprivate typealias Bridge = IBindableVectorBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.getat)
        fileprivate func getAt(_ index: UInt32) throws -> Any! {
            try _default.GetAtImpl(index)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.getview)
        fileprivate func getView() throws -> AnyIBindableVectorView! {
            try _default.GetViewImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.indexof)
        fileprivate func indexOf(_ value: Any!, _ index: inout UInt32) throws -> Bool {
            try _default.IndexOfImpl(value, &index)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.setat)
        fileprivate func setAt(_ index: UInt32, _ value: Any!) throws {
            try _default.SetAtImpl(index, value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.insertat)
        fileprivate func insertAt(_ index: UInt32, _ value: Any!) throws {
            try _default.InsertAtImpl(index, value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.removeat)
        fileprivate func removeAt(_ index: UInt32) throws {
            try _default.RemoveAtImpl(index)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.append)
        fileprivate func append(_ value: Any!) throws {
            try _default.AppendImpl(value)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.removeatend)
        fileprivate func removeAtEnd() throws {
            try _default.RemoveAtEndImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.clear)
        fileprivate func clear() throws {
            try _default.ClearImpl()
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.size)
        fileprivate var size : UInt32 {
            get { try! _default.get_SizeImpl() }
        }

        private lazy var _IBindableIterable: __ABI_Microsoft_UI_Xaml_Interop.IBindableIterable! = getInterfaceForCaching()
        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevector.first)
        fileprivate func first() throws -> AnyIBindableIterator! {
            try _IBindableIterable.FirstImpl()
        }

    }

    public enum IBindableVectorViewBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CIBindableVectorView
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.IBindableVectorView
        public typealias SwiftProjection = AnyIBindableVectorView
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return IBindableVectorViewImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Interop.IBindableVectorViewVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class IBindableVectorViewImpl: IBindableVectorView, WinRTAbiImpl {
        fileprivate typealias Bridge = IBindableVectorViewBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevectorview.getat)
        fileprivate func getAt(_ index: UInt32) throws -> Any! {
            try _default.GetAtImpl(index)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevectorview.indexof)
        fileprivate func indexOf(_ value: Any!, _ index: inout UInt32) throws -> Bool {
            try _default.IndexOfImpl(value, &index)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevectorview.size)
        fileprivate var size : UInt32 {
            get { try! _default.get_SizeImpl() }
        }

        private lazy var _IBindableIterable: __ABI_Microsoft_UI_Xaml_Interop.IBindableIterable! = getInterfaceForCaching()
        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.ibindablevectorview.first)
        fileprivate func first() throws -> AnyIBindableIterator! {
            try _IBindableIterable.FirstImpl()
        }

    }

    public enum INotifyCollectionChangedBridge : AbiInterfaceBridge {
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CINotifyCollectionChanged
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.INotifyCollectionChanged
        public typealias SwiftProjection = AnyINotifyCollectionChanged
        public static func from(abi: ComPtr<CABI>?) -> SwiftProjection? {
            guard let abi = abi else { return nil }
            return INotifyCollectionChangedImpl(abi)
        }

        public static func makeAbi() -> CABI {
            let vtblPtr = withUnsafeMutablePointer(to: &__ABI_Microsoft_UI_Xaml_Interop.INotifyCollectionChangedVTable) { $0 }
            return .init(lpVtbl: vtblPtr)
        }
    }

    fileprivate class INotifyCollectionChangedImpl: INotifyCollectionChanged, WinRTAbiImpl {
        fileprivate typealias Bridge = INotifyCollectionChangedBridge
        fileprivate let _default: Bridge.SwiftABI
        fileprivate var thisPtr: WindowsFoundation.IInspectable { _default }
        fileprivate init(_ fromAbi: ComPtr<Bridge.CABI>) {
            _default = Bridge.SwiftABI(fromAbi)
        }

        /// [Open Microsoft documentation](https://learn.microsoft.com/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.interop.inotifycollectionchanged.collectionchanged)
        fileprivate lazy var collectionChanged : Event<NotifyCollectionChangedEventHandler> = {
          .init(
            add: { [weak self] in
              guard let this = self?._default else { return .init() }
              return try! this.add_CollectionChangedImpl($0)
            },
            remove: { [weak self] in
             try? self?._default.remove_CollectionChangedImpl($0)
           }
          )
        }()

    }

    public class NotifyCollectionChangedEventHandlerBridge : WinRTDelegateBridge {
        public typealias Handler = NotifyCollectionChangedEventHandler
        public typealias CABI = __x_ABI_CMicrosoft_CUI_CXaml_CInterop_CINotifyCollectionChangedEventHandler
        public typealias SwiftABI = __ABI_Microsoft_UI_Xaml_Interop.NotifyCollectionChangedEventHandler

        public static func from(abi: ComPtr<CABI>?) -> Handler? {
            guard let abi = abi else { return nil }
            let _default = SwiftABI(abi)
            let handler: Handler = { (sender, e) in
                try! _default.InvokeImpl(sender, e)
            }
            return handler
        }
    }
}
