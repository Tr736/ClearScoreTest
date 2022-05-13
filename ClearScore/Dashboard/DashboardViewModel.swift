import Foundation
class DashboardViewModel {
    private var api: APIType
    private(set) var data: DashboardAPIResponse?

    init(api: APIType) {
        self.api = api
        Task {
            do {
                try await self.fetchDashboardData()
            } catch {
                print(error)
            }
        }
    }

    func fetchDashboardData() async throws {
        let request = DashboardAPIRequest()
        self.data = try await api.execute(apiRequest: request)
    }
}
