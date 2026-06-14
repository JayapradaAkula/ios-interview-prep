import Foundation

public enum NetworkError: Error, Equatable {
    case invalidURL
    case unauthorized
    case server(Int)
    case decoding(String)
    case noConnection
    case cancelled
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public struct Endpoint {
    public let path: String
    public let method: HTTPMethod
    public var headers: [String: String]
    public let queryItems: [URLQueryItem]?
    public let body: Data?

    public init(
        path: String,
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        queryItems: [URLQueryItem]? = nil,
        body: Data? = nil
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.queryItems = queryItems
        self.body = body
    }

  public var url: URL? {
        var components = URLComponents(string: path)
        components?.queryItems = queryItems
        return components?.url
    }
}
