import XCTest

internal enum Dashboard {
    static let screen = XCUIApplication().otherElements["DashboardViewController"].firstMatch
    
    static let navigationBar = XCUIApplication().navigationBars.firstMatch
}
