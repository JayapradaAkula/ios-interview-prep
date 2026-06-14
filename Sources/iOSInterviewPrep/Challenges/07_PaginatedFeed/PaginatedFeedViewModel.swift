import Combine
import Foundation

// MARK: - Challenge 07: Paginated Feed (Zillow / Uber style)

public protocol ListingServicing {
    func fetchListings(cursor: String?) async throws -> PaginatedResponse<Listing>
}

public final class MockListingService: ListingServicing {
    public var pages: [PaginatedResponse<Listing>] = []
    public var fetchCount = 0

    public init() {}

    public func fetchListings(cursor: String?) async throws -> PaginatedResponse<Listing> {
        fetchCount += 1
        if cursor == nil {
            return pages.first ?? PaginatedResponse(items: [], nextCursor: nil)
        }
        for (index, page) in pages.enumerated() {
            if page.nextCursor == cursor {
                let nextIndex = index + 1
                if nextIndex < pages.count {
                    return pages[nextIndex]
                }
                break
            }
        }
        return PaginatedResponse(items: [], nextCursor: nil)
    }
}

@MainActor
public final class PaginatedFeedViewModel: ObservableObject {
    @Published public private(set) var items: [Listing] = []
    @Published public private(set) var isLoading = false
    @Published public private(set) var isRefreshing = false

    private let service: ListingServicing
    private var nextCursor: String?
    private var loadTask: Task<Void, Never>?

    public init(service: ListingServicing) {
        self.service = service
    }

    public func loadInitial() async {
        // TODO: Challenge 3.3
    }

    public func loadNextPageIfNeeded(currentIndex: Int) async {
        // TODO: Challenge 3.3 — prefetch when within 5 of end, no duplicates
    }

    public func refresh() async {
        // TODO: Challenge 3.3 — reset cursor and items
    }
}
