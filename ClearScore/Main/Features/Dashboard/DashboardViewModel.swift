import Foundation
import Combine
class DashboardViewModel {
    private var api: APIType
    private(set) var data: DashboardAPIResponse?
    internal var shouldRetryFetch = PassthroughSubject<Bool, Never>()
    @Published private(set)var score: Score?
    init(api: APIType) {
        self.api = api
    }

    func fetchDashboardData() {
        let request = DashboardAPIRequest()
        Task {
            do {
                data = try await api.execute(apiRequest: request)
                if let data = data {
                    score = Score(dashboardResponse: data)
                }
                shouldRetryFetch.send(false)
            } catch {
                shouldRetryFetch.send(true)
            }
        }
    }
}
