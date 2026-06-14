import Combine
import Foundation

// MARK: - Challenge 02: Debounced Search

public protocol SearchServicing {
    func search(query: String) async throws -> [String]
}

public final class MockSearchService: SearchServicing {
    public var delayNanoseconds: UInt64 = 0
    public var resultsForQuery: [String: [String]] = [:]
    public var callCount = 0

    public init() {}

    public func search(query: String) async throws -> [String] {
        callCount += 1
        if delayNanoseconds > 0 {
            try await Task.sleep(nanoseconds: delayNanoseconds)
        }
        return resultsForQuery[query] ?? []
    }
}

@MainActor
public final class SearchViewModel: ObservableObject {
    @Published public private(set) var results: [String] = []
    @Published public private(set) var isLoading = false

    private let service: SearchServicing
    private let debounceNanoseconds: UInt64
    private var searchTask: Task<Void, Never>?

    public init(service: SearchServicing, debounceMilliseconds: Int = 300) {
        self.service = service
        self.debounceNanoseconds = UInt64(debounceMilliseconds) * 1_000_000
    }

  public func queryChanged(_ text: String) {
        // TODO: Challenge 1.2 — debounce, cancel prior task, handle empty query
        searchTask?.cancel()
        searchTask = Task {
            // Stub: immediate search without debounce
            isLoading = true
            do {
                let items = try await service.search(query: text)
                guard !Task.isCancelled else { return }
                results = items
            } catch {
                guard !Task.isCancelled else { return }
                results = []
            }
            isLoading = false
        }
    }
}
