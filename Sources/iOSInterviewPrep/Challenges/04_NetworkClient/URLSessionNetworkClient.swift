import Foundation

// MARK: - Challenge 04: URLSession NetworkClient

public final class URLSessionNetworkClient: NetworkClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let baseURL: URL

    public init(
        baseURL: URL,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.decoder = decoder
    }

    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        // TODO: Challenge 2.1 — build URLRequest, map status codes, decode JSON
        throw NetworkError.invalidURL
    }
}
