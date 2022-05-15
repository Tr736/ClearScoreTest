import Foundation
import XCTest
internal class ClearScoreTestCase: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func launch() {
        app = XCUIApplication()
        app.launchEnvironment = [
            AppContext.LaunchEnvironment.Keys.uiTests: "1",
            AppContext.LaunchEnvironment.Keys.isOffline: "0"
        ]
        app.launch()
    }
}

internal class ClearScoreOfflineTestcase: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func launch() {
        app = XCUIApplication()
        app.launchEnvironment = [
            AppContext.LaunchEnvironment.Keys.uiTests: "1",
            AppContext.LaunchEnvironment.Keys.isOffline: "1"
        ]
        app.launch()
    }
}
