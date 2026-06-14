import XCTest
@testable import iOSInterviewPrep

final class Challenge05AuthCoordinatorTests: XCTestCase {
    func testSingleFlightRefreshOnParallel401() async throws {
        let client = MockNetworkClient()
        let store = ActorTokenStore()
        await store.set("expired-token")

        let refresher = MockTokenRefresher()
        refresher.simulatedDelayNanoseconds = 100_000_000
        refresher.tokenToReturn = "fresh-token"

        var unauthorizedWithoutFreshToken = 0
        client.handlers["/hotels"] = { endpoint in
            if endpoint.headers["Authorization"] == "Bearer fresh-token" {
                return [Hotel(id: "1", name: "IHG", city: "Atlanta", pricePerNight: 150)]
            }
            unauthorizedWithoutFreshToken += 1
            throw NetworkError.unauthorized
        }

        let coordinator = AuthCoordinator(client: client, tokenStore: store, refresher: refresher)

        try await withThrowingTaskGroup(of: [Hotel].self) { group in
            for _ in 0..<10 {
                group.addTask {
                    try await coordinator.authorizedRequest(
                        Endpoint(path: "/hotels")
                    )
                }
            }
            for try await hotels in group {
                XCTAssertEqual(hotels.count, 1)
            }
        }

        XCTAssertEqual(refresher.refreshCount, 1)
    }
}
