import XCTest
@testable import ClearScore
class ScoreTests: XCTestCase {
    private enum Constants {
        static let min: CGFloat = 0
        static let max: CGFloat = 3
        static let actual: CGFloat = 1
    }
    private var sut: Score!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_Score_initiatedCorrectly() {
        sut = Score(min: Constants.min,
                    max: Constants.max,
                    actual: Constants.actual)
        XCTAssertEqual(sut.actual, Constants.actual)
        XCTAssertEqual(sut.max, Constants.max)
        XCTAssertEqual(sut.min, Constants.min)

    }
}
