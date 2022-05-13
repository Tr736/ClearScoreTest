import XCTest

internal enum Dashboard {
    static let screen = XCUIApplication().otherElements["DashboardViewController"].firstMatch
    
    static let navigationBarTitleIsDashboard = XCUIApplication().navigationBars["DashboardNavViewController"].staticTexts[LocalizedConstants.dashboardTitle].firstMatch
}
