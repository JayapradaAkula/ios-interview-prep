import XCTest
@testable import iOSInterviewPrep

final class Challenge01TokenBoxTests: XCTestCase {
    func testSetAndGet() async {
        let store = ActorTokenStore()
        await store.set("access-token-123")
        let token = await store.get()
        XCTAssertEqual(token, "access-token-123")
    }

    func testClearRemovesToken() async {
        let store = ActorTokenStore()
        await store.set("token")
        await store.clear()
        let token = await store.get()
        XCTAssertNil(token)
    }

    func testConcurrentAccess() async {
        let store = ActorTokenStore()
        await withTaskGroup(of: Void.self) { group in
            for i in 0..<100 {
                group.addTask {
                    await store.set("token-\(i)")
                }
            }
            for _ in 0..<100 {
                group.addTask {
                    _ = await store.get()
                }
            }
        }
        let final = await store.get()
        XCTAssertNotNil(final)
    }
}
