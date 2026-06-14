import Foundation

// MARK: - Challenge 08: Image Loader with in-flight coalescing

public struct ImagePayload: Equatable {
    public let url: URL
    public let data: Data

    public init(url: URL, data: Data) {
        self.url = url
        self.data = data
    }
}

public protocol ImageDataLoading {
    func load(url: URL) async throws -> Data
}

public final class MockImageDataLoader: ImageDataLoading {
    public var payloads: [URL: Data] = [:]
    public var loadCount = 0
    public var delayNanoseconds: UInt64 = 0

    public init() {}

    public func load(url: URL) async throws -> Data {
        loadCount += 1
        if delayNanoseconds > 0 {
            try await Task.sleep(nanoseconds: delayNanoseconds)
        }
        guard let data = payloads[url] else {
            throw NetworkError.server(404)
        }
        return data
    }
}

public actor ImageLoader {
    private let remoteLoader: ImageDataLoading
    private var memoryCache: [URL: Data] = [:]
    private var inFlight: [URL: Task<Data, Error>] = [:]

    public init(remoteLoader: ImageDataLoading) {
        self.remoteLoader = remoteLoader
    }

    public func load(url: URL) async throws -> Data {
        // TODO: Challenge 3.4 — memory cache + single in-flight download per URL
        try await remoteLoader.load(url: url)
    }

    public func clearCache() {
        memoryCache.removeAll()
    }
}

/// Cell reuse safety via generation token pattern.
public final class ListingImageViewModel {
    private let loader: ImageLoader
    private var generation: UInt = 0
    public var displayedURL: URL?
    public var displayedData: Data?

    public init(loader: ImageLoader) {
        self.loader = loader
    }

    public func configure(imageURL: URL) async {
        // TODO: Challenge 3.4 — ignore stale results after reuse
        generation += 1
        let token = generation
        displayedURL = imageURL
        do {
            let data = try await loader.load(url: imageURL)
            guard token == generation else { return }
            displayedData = data
        } catch {
            guard token == generation else { return }
            displayedData = nil
        }
    }
}
