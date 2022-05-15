import Foundation
@testable import ClearScore
struct MockAPI: APIType {

    private let jsonDecoder = JSONDecoder()

    enum MockAPIError: Error {
        case notImplemented
        case pathNotAddedToMockAPI
    }
    
    func execute<T>(apiRequest: T) async throws -> T.ResponseBody where T : APIRequest {
        switch apiRequest.path {
        case "prod/mockcredit/values":
            return try jsonDecoder.decode(T.ResponseBody.self, from: MockAPIResponse.loadContents(of: "creditReportInfo", with: "json"))
        default:
            throw MockAPIError.pathNotAddedToMockAPI
        }
    }

    func executeRaw<T>(apiRequest: T) async throws -> (data: Data, response: URLResponse) {
        throw MockAPIError.notImplemented
    }

}
