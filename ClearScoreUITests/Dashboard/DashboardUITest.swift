import XCTest

class DashboardUITest: ClearScoreTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func test_dashboard_journey() {
        launch()
        XCTAssertTrue(Dashboard.screen.wait())
        XCTAssertTrue(Dashboard.navigationBarTitleIsDashboard.wait())
    }

}
