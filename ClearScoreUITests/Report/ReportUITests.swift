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
        XCTAssertTrue(Dashboard.screen.wait())
        
    }

}
