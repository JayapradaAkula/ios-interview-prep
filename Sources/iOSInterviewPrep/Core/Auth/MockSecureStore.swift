import Foundation

public protocol SecureStore {
    func save(_ data: Data, key: String) throws
    func load(key: String) throws -> Data?
    func delete(key: String) throws
}

/// In-memory secure store for unit tests (not for production).
public final class MockSecureStore: SecureStore {
    private var storage: [String: Data] = [:]
    private let lock = NSLock()

    public init() {}

    public func save(_ data: Data, key: String) throws {
        lock.lock()
        storage[key] = data
        lock.unlock()
    }

    public func load(key: String) throws -> Data? {
        lock.lock()
        let value = storage[key]
        lock.unlock()
        return value
    }

    public func delete(key: String) throws {
        lock.lock()
        storage.removeValue(forKey: key)
        lock.unlock()
    }
}
