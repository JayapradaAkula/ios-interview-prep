import Foundation

// MARK: - Challenge 01: Thread-Safe Token Box

/// Thread-safe token storage using Swift `actor` isolation.
public actor ActorTokenStore: TokenStoring {
    public init() {}

    private var token: String?

    public func get() async -> String? {
        token
    }

    public func set(_ token: String) async {
        self.token = token
    }

    public func clear() async {
        token = nil
    }
}
