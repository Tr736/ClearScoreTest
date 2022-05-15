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
        XCTAssertTrue(ScoreView.view.wait())
        XCTAssertTrue(ScoreView.blurView.wait())
        XCTAssertTrue(ScoreView.titleLabel.wait())
        XCTAssertTrue(ScoreView.subtitleLabel.wait())
        XCTAssertTrue(ScoreView.scoreLabel.wait())
        XCTAssertTrue(ScoreView.circularProgressView.wait())

        Dashboard.screen.swipeLeft()
        XCTAssertTrue(Report.screen.wait())
        Report.screen.swipeLeft()
        XCTAssertTrue(Report.screen.wait())
        Report.screen.swipeRight()
        XCTAssertTrue(Dashboard.screen.wait())
        Dashboard.screen.swipeRight()
        XCTAssertTrue(Dashboard.screen.wait())

    }

}
