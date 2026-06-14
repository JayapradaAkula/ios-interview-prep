import XCTest
@testable import iOSInterviewPrep

final class Challenge06LRUCacheTests: XCTestCase {
    func testGetSetBasic() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.set("a", 1)
        cache.set("b", 2)
        XCTAssertEqual(cache.get("a"), 1)
        XCTAssertEqual(cache.get("b"), 2)
        XCTAssertEqual(cache.count, 2)
    }

    func testEvictsLeastRecentlyUsed() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.set("a", 1)
        cache.set("b", 2)
        cache.get("a")
        cache.set("c", 3)
        XCTAssertNil(cache.get("b"))
        XCTAssertEqual(cache.get("a"), 1)
        XCTAssertEqual(cache.get("c"), 3)
    }

    func testGetUpdatesRecency() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.set("a", 1)
        cache.set("b", 2)
        cache.get("b")
        cache.set("c", 3)
        XCTAssertNil(cache.get("a"))
        XCTAssertEqual(cache.get("b"), 2)
    }
}
