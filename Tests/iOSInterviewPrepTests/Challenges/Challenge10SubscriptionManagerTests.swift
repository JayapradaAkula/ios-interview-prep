import XCTest
@testable import iOSInterviewPrep

final class Challenge10SubscriptionManagerTests: XCTestCase {
    func testPurchaseUpdatesToActive() async throws {
        let service = MockSubscriptionService()
        let expires = Date().addingTimeInterval(86400 * 30)
        service.statusAfterPurchase = .active(expires: expires)

        let manager = SubscriptionManager(service: service)
        try await manager.purchase(productID: SubscriptionProduct.monthly.rawValue)
        try await manager.refreshEntitlement()

        let status = await manager.currentStatus()
        XCTAssertEqual(status, .active(expires: expires))
    }

    func testRestoreFreeWhenNoPurchases() async throws {
        let service = MockSubscriptionService()
        service.statusAfterRestore = .free

        let manager = SubscriptionManager(service: service)
        try await manager.restore()

        let status = await manager.currentStatus()
        XCTAssertEqual(status, .free)
    }

    func testRestoreActiveSubscription() async throws {
        let service = MockSubscriptionService()
        let expires = Date().addingTimeInterval(86400 * 365)
        service.statusAfterRestore = .active(expires: expires)

        let manager = SubscriptionManager(service: service)
        try await manager.restore()

        let status = await manager.currentStatus()
        XCTAssertEqual(status, .active(expires: expires))
    }
}
