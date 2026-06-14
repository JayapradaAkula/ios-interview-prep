import Foundation

// MARK: - Challenge 03: Retry with Exponential Backoff

public func isRetryableNetworkError(_ error: Error) -> Bool {
    if case NetworkError.server(let code) = error {
        return code >= 500
    }
    if case NetworkError.noConnection = error {
        return true
    }
    return false
}

public func withRetry<T>(
    maxAttempts: Int = 3,
    initialDelayNanoseconds: UInt64 = 500_000_000,
    isRetryable: (Error) -> Bool = isRetryableNetworkError,
    operation: () async throws -> T
) async throws -> T {
    // TODO: Challenge 1.3 — exponential backoff, respect cancellation
    try await operation()
}
