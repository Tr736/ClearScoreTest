import Foundation
import Combine
class DashboardViewModel {
    private var api: APIType
    private(set) var data: DashboardAPIResponse?
    internal var shouldRetryFetch = PassthroughSubject<Bool, Never>()

    init(api: APIType) {
        self.api = api
    }

    func fetchDashboardData() {
        let request = DashboardAPIRequest()
        Task {
            do {
                data = try await api.execute(apiRequest: request)
                shouldRetryFetch.send(false)
            } catch {
                shouldRetryFetch.send(true)
            }
        }
    }
}
