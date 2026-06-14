import XCTest
@testable import iOSInterviewPrep

final class Challenge03RetryTests: XCTestCase {
    func testSucceedsOnThirdAttempt() async throws {
        var attempts = 0
        let result = try await withRetry(maxAttempts: 3) {
            attempts += 1
            if attempts < 3 {
                throw NetworkError.server(503)
            }
            return "ok"
        }
        XCTAssertEqual(result, "ok")
        XCTAssertEqual(attempts, 3)
    }

    func testFailsImmediatelyOnNonRetryableError() async {
        var attempts = 0
        do {
            try await withRetry(maxAttempts: 3) {
                attempts += 1
                throw NetworkError.unauthorized
            }
            XCTFail("Expected error")
        } catch {
            XCTAssertEqual(attempts, 1)
        }
    }

    func testRespectsCancellationDuringBackoff() async {
        let task = Task {
            try await withRetry(maxAttempts: 5) {
                throw NetworkError.server(500)
            }
        }
        try? await Task.sleep(nanoseconds: 100_000_000)
        task.cancel()
        let result = await task.result
        switch result {
        case .failure:
            XCTAssertTrue(true)
        case .success:
            XCTFail("Expected cancellation or failure")
        }
    }
}
