import Foundation

struct ConcreteAPI: APIType {
    private let urlSession: URLSessionType
    private let baseURL: URL?

    init(baseURL: URL? = URL(string: Endpoints.baseURL),
         urlSession: URLSessionType = URLSession.shared) {
        self.baseURL = baseURL
        self.urlSession = urlSession
    }

    func execute<T>(apiRequest: T) async throws -> T.ResponseBody where T : APIRequest {
        let data = try await executeRaw(apiRequest: apiRequest).data
        let decoded: T.ResponseBody = try decode(from: data)
        return decoded
    }

    func executeRaw<T>(apiRequest: T) async throws -> (data: Data, response: URLResponse) where T : APIRequest {
        guard let url = try? buildUrl(for: apiRequest) else { throw APIError.invalidUrl(urlString: apiRequest.path )}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRequest.method.rawValue
        urlRequest.setValue(Headers.contentTypeJson,
                         forHTTPHeaderField: Headers.contentType)
        return try await urlSession.data(request: urlRequest)
    }

    private func decode<T>(from data: Data) throws -> T where T: Decodable {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    private func buildUrl<T: APIRequest>(for apiRequest: T) throws -> URL {
        guard let components = URLComponents(string: apiRequest.path),
              let url = components.url(relativeTo: baseURL) else {
            throw APIError.invalidUrl(urlString: apiRequest.path)
        }
        return url
    }
}