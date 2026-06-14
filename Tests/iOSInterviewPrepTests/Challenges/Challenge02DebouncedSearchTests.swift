import XCTest
@testable import iOSInterviewPrep

@MainActor
final class Challenge02DebouncedSearchTests: XCTestCase {
    func testEmptyQueryClearsWithoutNetworkCall() async {
        let service = MockSearchService()
        service.resultsForQuery["atl"] = ["Atlanta"]
        let viewModel = SearchViewModel(service: service, debounceMilliseconds: 100)

        viewModel.queryChanged("atl")
        try? await Task.sleep(nanoseconds: 200_000_000)
        XCTAssertEqual(viewModel.results, ["Atlanta"])

        viewModel.queryChanged("")
        try? await Task.sleep(nanoseconds: 200_000_000)
        XCTAssertEqual(viewModel.results, [])
        XCTAssertEqual(service.callCount, 1)
    }

    func testDebounceOnlyLastQueryFires() async {
        let service = MockSearchService()
        service.delayNanoseconds = 50_000_000
        service.resultsForQuery["atlanta"] = ["Atlanta"]
        let viewModel = SearchViewModel(service: service, debounceMilliseconds: 100)

        viewModel.queryChanged("a")
        viewModel.queryChanged("at")
        viewModel.queryChanged("atlanta")

        try? await Task.sleep(nanoseconds: 400_000_000)

        XCTAssertEqual(viewModel.results, ["Atlanta"])
        XCTAssertEqual(service.callCount, 1)
    }

    func testStaleResultIgnoredAfterNewQuery() async {
        let service = MockSearchService()
        service.delayNanoseconds = 200_000_000
        service.resultsForQuery["slow"] = ["Slow"]
        service.resultsForQuery["fast"] = ["Fast"]
        let viewModel = SearchViewModel(service: service, debounceMilliseconds: 50)

        viewModel.queryChanged("slow")
        try? await Task.sleep(nanoseconds: 100_000_000)
        viewModel.queryChanged("fast")
        try? await Task.sleep(nanoseconds: 400_000_000)

        XCTAssertEqual(viewModel.results, ["Fast"])
    }
}
