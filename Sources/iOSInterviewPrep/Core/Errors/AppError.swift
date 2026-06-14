import Foundation

public enum AppError: Error, Equatable, LocalizedError {
    case offline
    case sessionExpired
    case validation(String)
    case somethingWentWrong

    public var errorDescription: String? {
        switch self {
        case .offline:
            return "Check your connection and try again."
        case .sessionExpired:
            return "Please sign in again."
        case .validation(let message):
            return message
        case .somethingWentWrong:
            return "Something went wrong."
        }
    }

    public var isRetryable: Bool {
        switch self {
        case .offline:
            return true
        default:
            return false
        }
    }
}
