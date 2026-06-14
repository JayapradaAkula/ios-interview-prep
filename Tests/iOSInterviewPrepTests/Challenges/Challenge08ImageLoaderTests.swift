import XCTest
@testable import iOSInterviewPrep

final class Challenge08ImageLoaderTests: XCTestCase {
    func testInFlightCoalescing() async throws {
        let remote = MockImageDataLoader()
        let url = URL(string: "https://example.com/img.png")!
        remote.payloads[url] = Data([0x01, 0x02])
        remote.delayNanoseconds = 100_000_000

        let loader = ImageLoader(remoteLoader: remote)

        async let a = loader.load(url: url)
        async let b = loader.load(url: url)
        let results = try await [a, b]

        XCTAssertEqual(results[0], results[1])
        XCTAssertEqual(remote.loadCount, 1)
    }

    func testMemoryCacheHit() async throws {
        let remote = MockImageDataLoader()
        let url = URL(string: "https://example.com/cached.png")!
        remote.payloads[url] = Data([0xFF])

        let loader = ImageLoader(remoteLoader: remote)
        _ = try await loader.load(url: url)
        _ = try await loader.load(url: url)

        XCTAssertEqual(remote.loadCount, 1)
    }

    func testCellReuseIgnoresStaleResult() async {
        let remote = MockImageDataLoader()
        let slowURL = URL(string: "https://example.com/slow.png")!
        let fastURL = URL(string: "https://example.com/fast.png")!
        remote.payloads[slowURL] = Data([0x01])
        remote.payloads[fastURL] = Data([0x02])
        remote.delayNanoseconds = 200_000_000

        let loader = ImageLoader(remoteLoader: remote)
        let cell = ListingImageViewModel(loader: loader)

        Task { await cell.configure(imageURL: slowURL) }
        try? await Task.sleep(nanoseconds: 50_000_000)
        await cell.configure(imageURL: fastURL)
        try? await Task.sleep(nanoseconds: 400_000_000)

        XCTAssertEqual(cell.displayedURL, fastURL)
        XCTAssertEqual(cell.displayedData, Data([0x02]))
    }
}
