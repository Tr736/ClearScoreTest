import Foundation

struct DashboardAPIRequest: APIRequest {
    typealias ResponseBody = DashboardAPIResponse

    var method: RequestMethod = .get
    var path: String = Endpoints.mockCreditReport

}
