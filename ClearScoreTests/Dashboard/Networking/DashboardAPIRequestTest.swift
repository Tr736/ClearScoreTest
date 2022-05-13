import XCTest
@testable import ClearScore
class DashboardAPIRequestTest: XCTestCase {
    private var sut: DashboardAPIRequest!
    override func setUp() {
        super.setUp()
        sut = DashboardAPIRequest()
    }

    override class func tearDown() {
        super.tearDown()
    }

    func test_APIRequestMethod_Get() {
        XCTAssertTrue(sut.method == .get)
    }

    func test_APIRequestPath() {
        XCTAssertTrue(sut.path == Endpoints.mockCreditReport)
    }

}
