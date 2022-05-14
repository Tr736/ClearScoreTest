import XCTest

internal enum Dashboard {
    static let screen = XCUIApplication().otherElements["DashboardViewController"].firstMatch
    
    static let navigationBarTitleIsDashboard = XCUIApplication().navigationBars["DashboardNavViewController"].staticTexts[LocalizedConstants.dashboardTitle].firstMatch
}

internal enum ScoreView {
    static let view = XCUIApplication().otherElements["scoreView"].firstMatch

    static let circularProgressView = XCUIApplication().otherElements["CircularProgressView"].firstMatch

    static let blurView = XCUIApplication().otherElements["blurView"].firstMatch
    static let titleLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "titleLabel").firstMatch
    static let subtitleLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "subtitleLabel").firstMatch
    static let scoreLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "scoreLabel").firstMatch
}
