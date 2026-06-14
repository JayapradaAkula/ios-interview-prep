import Foundation

// MARK: - Challenge 05: Single-Flight Auth Coordinator

public protocol TokenRefreshing {
    func refresh() async throws -> String
}

public final class MockTokenRefresher: TokenRefreshing {
    public var refreshCount = 0
    public var simulatedDelayNanoseconds: UInt64 = 0
    public var tokenToReturn = "new-access-token"
    public var errorToThrow: Error?

    public init() {}

    public func refresh() async throws -> String {
        refreshCount += 1
        if simulatedDelayNanoseconds > 0 {
            try await Task.sleep(nanoseconds: simulatedDelayNanoseconds)
        }
        if let errorToThrow {
            throw errorToThrow
        }
        return tokenToReturn
    }
}

public actor AuthCoordinator {
    private let client: NetworkClient
    private let tokenStore: TokenStoring
    private let refresher: TokenRefreshing

    public init(
        client: NetworkClient,
        tokenStore: TokenStoring,
        refresher: TokenRefreshing
    ) {
        self.client = client
        self.tokenStore = tokenStore
        self.refresher = refresher
    }

    public func authorizedRequest<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        // TODO: Challenge 2.2 — attach token, handle 401 with single-flight refresh + retry
        try await client.request(endpoint)
    }

    public func logout() async {
        // TODO: Challenge 2.4 — clear token, cancel in-flight refresh
        await tokenStore.clear()
    }
}
