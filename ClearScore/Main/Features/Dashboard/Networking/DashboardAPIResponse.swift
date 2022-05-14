import Foundation
struct DashboardAPIResponse: Decodable {
    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfoResponse
    let dashboardStatus: String
    let personaType: String
    let coachingSummary: CoachingSummaryResponse
    let augmentedCreditScore: Int?
}
