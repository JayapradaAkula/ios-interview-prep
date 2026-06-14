import Foundation

public struct CachedResponse: Codable, Equatable {
    public let data: Data
    public let etag: String?
    public let fetchedAt: Date
    public let ttl: TimeInterval

    public init(data: Data, etag: String?, fetchedAt: Date, ttl: TimeInterval) {
        self.data = data
        self.etag = etag
        self.fetchedAt = fetchedAt
        self.ttl = ttl
    }

    public func isFresh(at date: Date = Date()) -> Bool {
        date.timeIntervalSince(fetchedAt) < ttl
    }
}
