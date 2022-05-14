import Foundation
struct AppContext {
    static var isUnitTesting: Bool {
        NSClassFromString("XCTest") != nil
    }

    static var isUITesting: Bool {
        ProcessInfo.processInfo.environment[LaunchEnvironment.Keys.uiTests] == "1"
    }

    internal class LaunchEnvironment: NSObject {
        internal enum Keys {
            static let uiTests = "UITest"
        }
    }
}
