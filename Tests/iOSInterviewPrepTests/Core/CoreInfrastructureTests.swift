import XCTest
@testable import iOSInterviewPrep

final class CoreInfrastructureTests: XCTestCase {
    func testMockNetworkClientRoutesByPath() async throws {
        let client = MockNetworkClient()
        client.handlers["/ping"] = { _ in "pong" }

        let result: String = try await client.request(Endpoint(path: "/ping"))
        XCTAssertEqual(result, "pong")
        XCTAssertEqual(client.requestCount, 1)
    }

    func testCachedResponseFreshness() {
        let response = CachedResponse(
            data: Data(),
            etag: "abc",
            fetchedAt: Date().addingTimeInterval(-60),
            ttl: 120
        )
        XCTAssertTrue(response.isFresh())
    }

    func testAppErrorRetryable() {
        XCTAssertTrue(AppError.offline.isRetryable)
        XCTAssertFalse(AppError.sessionExpired.isRetryable)
    }
}
