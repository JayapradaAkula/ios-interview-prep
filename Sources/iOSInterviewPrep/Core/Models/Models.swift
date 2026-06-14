import Foundation

public struct Hotel: Codable, Equatable, Identifiable {
    public let id: String
    public let name: String
    public let city: String
    public let pricePerNight: Double

    public init(id: String, name: String, city: String, pricePerNight: Double) {
        self.id = id
        self.name = name
        self.city = city
        self.pricePerNight = pricePerNight
    }
}

public struct Listing: Codable, Equatable, Identifiable {
    public let id: String
    public let title: String
    public let price: Double
    public let imageURL: URL?

    public init(id: String, title: String, price: Double, imageURL: URL? = nil) {
        self.id = id
        self.title = title
        self.price = price
        self.imageURL = imageURL
    }
}

public struct PaginatedResponse<T: Codable>: Codable, Equatable where T: Equatable {
    public let items: [T]
    public let nextCursor: String?

    public init(items: [T], nextCursor: String?) {
        self.items = items
        self.nextCursor = nextCursor
    }
}

public struct AuthTokens: Codable, Equatable {
    public let accessToken: String
    public let refreshToken: String

    public init(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
