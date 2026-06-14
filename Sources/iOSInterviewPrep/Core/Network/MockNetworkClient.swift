import Foundation

public protocol NetworkClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

/// Test double — configure responses per path.
public final class MockNetworkClient: NetworkClient {
    public var handlers: [String: (Endpoint) async throws -> Any] = [:]
    public var requestCount: Int = 0

    public init() {}

    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        requestCount += 1
        guard let handler = handlers[endpoint.path] else {
            throw NetworkError.server(404)
        }
        let result = try await handler(endpoint)
        guard let typed = result as? T else {
            throw NetworkError.decoding("Mock returned wrong type")
        }
        return typed
    }
}
