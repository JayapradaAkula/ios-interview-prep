import XCTest
@testable import iOSInterviewPrep

@MainActor
final class Challenge07PaginatedFeedTests: XCTestCase {
    func testLoadInitialAndNextPage() async {
        let service = MockListingService()
        service.pages = [
            PaginatedResponse(
                items: [Listing(id: "1", title: "A", price: 100)],
                nextCursor: "page2"
            ),
            PaginatedResponse(
                items: [Listing(id: "2", title: "B", price: 200)],
                nextCursor: nil
            ),
        ]
        let viewModel = PaginatedFeedViewModel(service: service)

        await viewModel.loadInitial()
        XCTAssertEqual(viewModel.items.count, 1)
        guard viewModel.items.count == 1 else { return }
        XCTAssertEqual(viewModel.items[0].id, "1")

        await viewModel.loadNextPageIfNeeded(currentIndex: 0)
        XCTAssertEqual(viewModel.items.count, 2)
        XCTAssertEqual(service.fetchCount, 2)
    }

    func testRefreshResetsWithoutDuplicates() async {
        let service = MockListingService()
        service.pages = [
            PaginatedResponse(
                items: [Listing(id: "1", title: "A", price: 100)],
                nextCursor: nil
            ),
        ]
        let viewModel = PaginatedFeedViewModel(service: service)

        await viewModel.loadInitial()
        await viewModel.refresh()
        XCTAssertEqual(viewModel.items.count, 1)
        guard viewModel.items.count == 1 else { return }
        XCTAssertEqual(viewModel.items[0].id, "1")
    }

    func testPrefetchThreshold() async {
        let service = MockListingService()
        let items = (1...10).map { Listing(id: "\($0)", title: "L\($0)", price: Double($0)) }
        service.pages = [
            PaginatedResponse(items: items, nextCursor: "next"),
            PaginatedResponse(items: [Listing(id: "11", title: "L11", price: 11)], nextCursor: nil),
        ]
        let viewModel = PaginatedFeedViewModel(service: service)
        await viewModel.loadInitial()

        await viewModel.loadNextPageIfNeeded(currentIndex: 5)
        XCTAssertEqual(viewModel.items.count, 11)
    }
}
