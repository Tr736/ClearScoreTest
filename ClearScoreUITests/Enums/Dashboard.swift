import XCTest

internal enum Dashboard {
    static let screen = XCUIApplication().otherElements["DashboardViewController"].firstMatch
}

internal enum ScoreView {
    static let view = XCUIApplication().otherElements["scoreView"].firstMatch

    static let circularProgressView = XCUIApplication().otherElements["CircularProgressView"].firstMatch

    static let blurView = XCUIApplication().otherElements["blurView"].firstMatch
    static let titleLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "titleLabel").firstMatch
    static let subtitleLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "subtitleLabel").firstMatch
    static let scoreLabel = XCUIApplication().staticTexts.element(matching: .any, identifier: "scoreLabel").firstMatch
    static let refreshButton =  XCUIApplication().buttons["refreshButton"].firstMatch
}

internal enum Report {
    static let screen = XCUIApplication().otherElements["ReportView"].firstMatch

}

internal enum TabBar {
    static let dashboardButton = XCUIApplication().tabBars.buttons.element(boundBy: 0)
    static let reportButton = XCUIApplication().tabBars.buttons.element(boundBy: 1)

}
