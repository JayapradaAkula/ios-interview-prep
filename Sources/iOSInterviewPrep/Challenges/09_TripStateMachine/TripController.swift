import Foundation

// MARK: - Challenge 09: Trip State Machine (Uber)

public enum TripState: Equatable {
    case idle
    case requesting
    case driverAssigned(driverName: String, etaMinutes: Int)
    case inProgress
    case completed
    case cancelled(reason: String)
    case failed(message: String)
}

public enum TripEvent: Equatable {
    case requestRide
    case driverAssigned(name: String, eta: Int)
    case tripStarted
    case tripCompleted
    case tripCancelled(reason: String)
    case requestFailed(message: String)
}

public final class TripController {
    public private(set) var state: TripState = .idle

    public init() {}

    public func handle(_ event: TripEvent) {
        // TODO: Challenge 4.3 — valid transitions only; ignore invalid / duplicate events
    }

    public var canRequestRide: Bool {
        state == .idle || state == .cancelled(reason: "") || isFailedOrCancelled
    }

    private var isFailedOrCancelled: Bool {
        if case .cancelled = state { return true }
        if case .failed = state { return true }
        return false
    }
}
