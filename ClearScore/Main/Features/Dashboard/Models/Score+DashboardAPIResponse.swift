import UIKit

extension Score {
    init(dashboardResponse: DashboardAPIResponse) {
        self.min = CGFloat(dashboardResponse.creditReportInfo.minScoreValue)
        self.max = CGFloat(dashboardResponse.creditReportInfo.maxScoreValue)
        self.actual = CGFloat(dashboardResponse.creditReportInfo.score)
    }
}
