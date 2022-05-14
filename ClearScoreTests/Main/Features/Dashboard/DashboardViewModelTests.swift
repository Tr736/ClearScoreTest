import XCTest
import Combine
@testable import ClearScore
class DashboardViewModelTests: XCTestCase {

    private enum Constants {
        static let failedMessage = "Failed to fetch "
        static let expectationName = "API Request"
        static let timeout: TimeInterval = 2

        static let accountIDVStatus = "PASS"
        static let score = 514
        static let scoreBand = 4
        static let clientRef = "CS-SED-655426-708782"
        static let status = "MATCH"
        static let maxScoreValue = 700
        static let minScoreValue = 0
        static let monthsSinceLastDefaulted = -1
        static let hasEverDefaulted = false
        static let monthsSinceLastDelinquent = 1
        static let hasEverBeenDelinquent = true
        static let percentageCreditUsed = 44
        static let percentageCreditUsedDirectionFlag = 1
        static let changedScore = 0
        static let currentShortTermDebt = 13758
        static let currentShortTermNonPromotionalDebt = 13758
        static let currentShortTermCreditLimit = 30600
        static let currentShortTermCreditUtilisation = 44
        static let changeInShortTermDebt = 549
        static let currentLongTermDebt = 24682
        static let currentLongTermNonPromotionalDebt = 24682
        static let changeInLongTermDebt = -327
        static let numPositiveScoreFactors = 9
        static let numNegativeScoreFactors = 0
        static let equifaxScoreBand = 4
        static let equifaxScoreBandDescription = "Excellent"
        static let daysUntilNextReport = 9
        static let dashboardStatus = "PASS"
        static let personaType = "INEXPERIENCED"
        static let activeTodo = false
        static let activeChat = true
        static let numberOfTodoItems = 0
        static let numberOfCompletedTodoItems = 0
        static let selected = true

    }
    private var sut: DashboardViewModel!
    private var api: APIType!
    private var cancellable: [AnyCancellable] = []

    override func setUp() {
        super.setUp()
        api = MockAPI()
        sut = DashboardViewModel(api: api)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        api = nil
    }

    func test_APIResponse() {
        let expectation = expectation(description: Constants.expectationName)

        sut.fetchDashboardData()
        sut.shouldRetryFetch.sink { shouldRetry in
            if !shouldRetry {
                expectation.fulfill()
            }
        }.store(in: &cancellable)

        sut.$score.sink { score in
            if let score = score {
                XCTAssertEqual(Int(score.max), Constants.maxScoreValue)
                XCTAssertEqual(Int(score.min), Constants.minScoreValue)
                XCTAssertEqual(Int(score.actual), Constants.score)
            }
        }.store(in: &cancellable)

        waitForExpectations(timeout: Constants.timeout)
        XCTAssertNotNil(sut.data)

        XCTAssertEqual(sut.data!.accountIDVStatus,
                       Constants.accountIDVStatus)
        XCTAssertEqual(sut.data!.creditReportInfo.score,
                       Constants.score)
        XCTAssertEqual(sut.data!.creditReportInfo.scoreBand,
                       Constants.scoreBand)
        XCTAssertEqual(sut.data!.creditReportInfo.clientRef,
                       Constants.clientRef)
        XCTAssertEqual(sut.data!.creditReportInfo.status,
                       Constants.status)
        XCTAssertEqual(sut.data!.creditReportInfo.maxScoreValue,
                       Constants.maxScoreValue)
        XCTAssertEqual(sut.data!.creditReportInfo.minScoreValue,
                       Constants.minScoreValue)
        XCTAssertEqual(sut.data!.creditReportInfo.monthsSinceLastDefaulted,
                       Constants.monthsSinceLastDefaulted)
        XCTAssertEqual(sut.data!.creditReportInfo.hasEverDefaulted,
                       Constants.hasEverDefaulted)
        XCTAssertEqual(sut.data!.creditReportInfo.monthsSinceLastDelinquent,
                       Constants.monthsSinceLastDelinquent)
        XCTAssertEqual(sut.data!.creditReportInfo.hasEverBeenDelinquent,
                       Constants.hasEverBeenDelinquent)
        XCTAssertEqual(sut.data!.creditReportInfo.percentageCreditUsed,
                       Constants.percentageCreditUsed)
        XCTAssertEqual(sut.data!.creditReportInfo.percentageCreditUsedDirectionFlag,
                       Constants.percentageCreditUsedDirectionFlag)
        XCTAssertEqual(sut.data!.creditReportInfo.changedScore,
                       Constants.changedScore)
        XCTAssertEqual(sut.data!.creditReportInfo.currentShortTermDebt,
                       Constants.currentShortTermDebt)
        XCTAssertEqual(sut.data!.creditReportInfo.currentShortTermNonPromotionalDebt,
                       Constants.currentShortTermNonPromotionalDebt)
        XCTAssertEqual(sut.data!.creditReportInfo.currentShortTermCreditLimit,
                       Constants.currentShortTermCreditLimit)
        XCTAssertEqual(sut.data!.creditReportInfo.currentShortTermCreditUtilisation,
                       Constants.currentShortTermCreditUtilisation )
        XCTAssertEqual(sut.data!.creditReportInfo.changeInShortTermDebt,
                       Constants.changeInShortTermDebt)
        XCTAssertEqual(sut.data!.creditReportInfo.currentLongTermDebt,
                       Constants.currentLongTermDebt)
        XCTAssertEqual(sut.data!.creditReportInfo.currentLongTermNonPromotionalDebt,
                       Constants.currentLongTermNonPromotionalDebt)
        XCTAssertNil(sut.data!.creditReportInfo.currentLongTermCreditLimit)
        XCTAssertNil(sut.data!.creditReportInfo.currentLongTermCreditUtilisation)
        XCTAssertEqual(sut.data!.creditReportInfo.changeInLongTermDebt,
                       Constants.changeInLongTermDebt)
        XCTAssertEqual(sut.data!.creditReportInfo.numPositiveScoreFactors,
                       Constants.numPositiveScoreFactors)
        XCTAssertEqual(sut.data!.creditReportInfo.numNegativeScoreFactors,
                       Constants.numNegativeScoreFactors)
        XCTAssertEqual(sut.data!.creditReportInfo.equifaxScoreBand,
                       Constants.equifaxScoreBand)
        XCTAssertEqual(sut.data!.creditReportInfo.equifaxScoreBandDescription,
                       Constants.equifaxScoreBandDescription)
        XCTAssertEqual(sut.data!.creditReportInfo.daysUntilNextReport,
                       Constants.daysUntilNextReport)
        XCTAssertEqual(sut.data!.dashboardStatus,
                       Constants.dashboardStatus)
        XCTAssertEqual(sut.data!.personaType,
                       Constants.personaType)
        XCTAssertEqual(sut.data!.coachingSummary.activeTodo,
                       Constants.activeTodo)
        XCTAssertEqual(sut.data!.coachingSummary.activeChat,
                       Constants.activeChat)
        XCTAssertEqual(sut.data!.coachingSummary.numberOfTodoItems,
                       Constants.numberOfTodoItems)
        XCTAssertEqual(sut.data!.coachingSummary.numberOfCompletedTodoItems,
                       Constants.numberOfCompletedTodoItems)
        XCTAssertEqual(sut.data!.coachingSummary.selected,
                       Constants.selected)
        XCTAssertNil(sut.data!.augmentedCreditScore)
    }
}
