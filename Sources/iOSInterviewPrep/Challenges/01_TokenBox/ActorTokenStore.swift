import Foundation

// MARK: - Challenge 01: Thread-Safe Token Box

/// Implement using `actor` (recommended) or another thread-safe approach.
public actor ActorTokenStore: TokenStoring {
    public init() {}

    public func get() async -> String? {
        // TODO: Challenge 1.1
        nil
    }

    public func set(_ token: String) async {
        // TODO: Challenge 1.1
    }

    public func clear() async {
        // TODO: Challenge 1.1
    }
}
