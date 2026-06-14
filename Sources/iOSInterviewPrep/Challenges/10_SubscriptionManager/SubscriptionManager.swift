import Foundation

// MARK: - Challenge 10: Subscription Manager (RevenueCat)

public enum SubscriptionStatus: Equatable {
    case unknown
    case free
    case trial(endDate: Date)
    case active(expires: Date)
    case billingRetry
    case expired
}

public enum SubscriptionProduct: String, CaseIterable {
    case monthly = "com.prep.monthly"
    case annual = "com.prep.annual"
}

public protocol SubscriptionServicing {
    func purchase(productID: String) async throws
    func restore() async throws -> SubscriptionStatus
    func currentEntitlement() async throws -> SubscriptionStatus
}

public final class MockSubscriptionService: SubscriptionServicing {
    public var purchaseCount = 0
    public var statusAfterPurchase: SubscriptionStatus = .active(expires: Date().addingTimeInterval(86400 * 30))
    public var statusAfterRestore: SubscriptionStatus = .free
    public var purchaseError: Error?
    public var restoreError: Error?

    public init() {}

    public func purchase(productID: String) async throws {
        purchaseCount += 1
        if let purchaseError { throw purchaseError }
    }

    public func restore() async throws -> SubscriptionStatus {
        if let restoreError { throw restoreError }
        return statusAfterRestore
    }

    public func currentEntitlement() async throws -> SubscriptionStatus {
        statusAfterPurchase
    }
}

public actor SubscriptionManager {
    private let service: SubscriptionServicing
    private var status: SubscriptionStatus = .unknown

    public init(service: SubscriptionServicing) {
        self.service = service
    }

    public func currentStatus() async -> SubscriptionStatus {
        status
    }

    public func purchase(productID: String) async throws {
        // TODO: Challenge 7.3 — update status on success/failure
        try await service.purchase(productID: productID)
    }

    public func restore() async throws {
        // TODO: Challenge 7.3
    }

    public func refreshEntitlement() async throws {
        // TODO: fetch current entitlement from service
    }
}
