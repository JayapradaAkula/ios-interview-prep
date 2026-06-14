import Foundation

// MARK: - Challenge 06: LRU Cache

public final class LRUCache<Key: Hashable, Value> {
    private let capacity: Int

    public init(capacity: Int) {
        self.capacity = capacity
    }

    public func get(_ key: Key) -> Value? {
        // TODO: Challenge 3.1 — O(1) get, update recency
        nil
    }

    public func set(_ key: Key, _ value: Value) {
        // TODO: Challenge 3.1 — O(1) set, evict LRU when over capacity
    }

    public var count: Int {
        // TODO: return current entry count
        0
    }
}
