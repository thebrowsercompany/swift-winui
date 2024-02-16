import Foundation
import WinSDK

/// Ensures that RunLoop.main gets drained in the context of a traditional Win32
/// message loop running on the main thread.
final class MainRunLoopTickler {
    private var timerID: UINT_PTR = 0

    private var readyToProcessMessages = false
    private var doWorkRecursionGuard = false

    fileprivate static let minIdleDelay: TimeInterval = 0.05
    fileprivate static let maxIdleDelay: TimeInterval = 1
    private static let doWorkMessage = UINT(WM_USER + 0xbc0)

    /// At any point in time `nextIdleDelay` describes the delay we'll schedule between the next runloop service and the one after that. Each time we have to wait for this delay,
    /// we will wait slightly longer on the next go-around (up to a max delay of `maxIdleDelay`).
    ///
    /// It is possible that the runloop will be serviced in the meantime (due to the `WH_CALLWNDPROCRET` hook), in which case we will reset this delay back to its minimum value.
    private var nextIdleDelay: TimeInterval = MainRunLoopTickler.minIdleDelay
    fileprivate static let instance: MainRunLoopTickler = .init()

    static func setup() {
        instance.start()
    }

    static func shutdown() {
        instance.shutdown()
    }

    private var hook: HHOOK?
    private func start() {
        // Hook all window message processing on the current thread. Use this as a
        // trigger to process RunLoop events, in case some are pending.
        hook = SetWindowsHookExW(WH_CALLWNDPROCRET, runLoopTicklerWindowHook, nil, GetCurrentThreadId())
        scheduleImmediateWork()
    }

    fileprivate func scheduleDelayedWork(after delay: TimeInterval) {
        // If requested to delay longer than 'nextIdleDelay', cap the delay at 'nextIdleDelay' and bump up 'nextIdleDelay' for the next time.
        let cappedDelay: TimeInterval
        if delay >= nextIdleDelay {
            cappedDelay = nextIdleDelay
            nextIdleDelay = min(nextIdleDelay + Self.minIdleDelay, Self.maxIdleDelay)
        } else {
            cappedDelay = max(delay, 0)
        }
        let delayMilliseconds = UInt32(cappedDelay * 1000)
        timerID = SetTimer(nil, timerID, delayMilliseconds, runLoopTicklerTimerProc)
    }

    fileprivate func scheduleImmediateWork() {
        // Whenever an immediate event comes in, reset our delay so that we will slowly decay in responsiveness when
        // interaction ceases.
        MainRunLoopTickler.instance.nextIdleDelay = MainRunLoopTickler.minIdleDelay

        if readyToProcessMessages {
            guard PostMessageW(nil, MainRunLoopTickler.doWorkMessage, 0, 0) else {
                print("Failed to post message to message window. Win32 Error Code: \(GetLastError())")
                return
            }
        } else {
            scheduleDelayedWork(after: 0)
        }
    }

    fileprivate func shutdown() {
        UnhookWindowsHookEx(hook)
        KillTimer(nil, timerID)
    }

    fileprivate func doWork() {
        guard doWorkRecursionGuard == false else { return }
        doWorkRecursionGuard = true
        defer { doWorkRecursionGuard = false }

        let nextDate = RunLoop.main.limitDate(forMode: .default)
        // A nil result is unexpected, but if it happens, we'll just try again promptly.
        let nextDelay = nextDate?.timeIntervalSinceNow ?? 0
        // Messages created via PostMessageW have scheduling priority over UI messages. To invert the priority,
        // scheduling immediate work is delayed if the thread has other pending messages. PostMessageW will
        // ultimately be called after all queued messages have been flushed thanks to the WH_CALLWNDPROCRET hook.
        scheduleDelayedWork(after: nextDelay)
    }
}

private let runLoopTicklerWindowHook: HOOKPROC = { (nCode: Int32, wParam: WPARAM, lParam: LPARAM) in
    if nCode >= 0 {
        let ptr = UnsafeRawPointer(bitPattern: Int(lParam))?.assumingMemoryBound(to: CWPRETSTRUCT.self)
        if let msgInfo = ptr?.pointee {
            // Give higher priority to input events.
            if (msgInfo.message >= WM_KEYFIRST && msgInfo.message < WM_KEYLAST)
                || (msgInfo.message >= WM_MOUSEFIRST && msgInfo.message < WM_MOUSELAST) {
                // Instead of calling doWork here, schedule immediate work to be done. That way we avoid dispatching
                // RunLoop events from this call stack, which might crash code that is not safe for re-entry.
                MainRunLoopTickler.instance.scheduleImmediateWork()
            } else if msgInfo.message != WM_GETICON {
                // Windows may deliver periodic WM_GETICON messages without any user input, don't pay attention to
                // these.
                MainRunLoopTickler.instance.scheduleDelayedWork(after: 0)
            }
        }
    }
    return CallNextHookEx(nil, nCode, wParam, lParam)
}

private let runLoopTicklerTimerProc: TIMERPROC = { (_: HWND?, _: UINT, _: UINT_PTR, _: DWORD) in
    MainRunLoopTickler.instance.doWork()
}
