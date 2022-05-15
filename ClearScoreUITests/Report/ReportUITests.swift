import XCTest

class ReportUITests: ClearScoreTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func test_report_Journey() {
        launch()
        TabBar.dashboardButton.tap()
        XCTAssertTrue(Dashboard.screen.wait())
        TabBar.reportButton.tap()
        XCTAssertTrue(Report.screen.wait())

    }
}


class ReportUIOfflineTests: ClearScoreOfflineTestcase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func test_report_Journey() {
        launch()
        TabBar.dashboardButton.tap()
        XCTAssertTrue(Dashboard.screen.wait())
        TabBar.reportButton.tap()
        XCTAssertTrue(Report.screen.wait())
    }
}
