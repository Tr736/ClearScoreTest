import XCTest

extension XCUIElement {
    private static let defaultTimeout: TimeInterval = 10

    func wait(timeout: TimeInterval = defaultTimeout) -> Bool {
        waitForExistence(timeout: timeout)
    }
}
