
import XCTest
@testable import ClearScore
class AppContextTest: XCTestCase {

    func test_isUnitTesting_true() {
        XCTAssertTrue(AppContext.isUnitTesting)
    }

    func test_isUITesting_false() {
        XCTAssertFalse(AppContext.isUITesting)
    }
}
