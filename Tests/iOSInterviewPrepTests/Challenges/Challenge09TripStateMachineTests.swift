import XCTest
@testable import iOSInterviewPrep

final class Challenge09TripStateMachineTests: XCTestCase {
    func testHappyPath() {
        let controller = TripController()
        controller.handle(.requestRide)
        XCTAssertEqual(controller.state, .requesting)

        controller.handle(.driverAssigned(name: "Sam", eta: 5))
        XCTAssertEqual(controller.state, .driverAssigned(driverName: "Sam", etaMinutes: 5))

        controller.handle(.tripStarted)
        XCTAssertEqual(controller.state, .inProgress)

        controller.handle(.tripCompleted)
        XCTAssertEqual(controller.state, .completed)
    }

    func testCancelFromRequesting() {
        let controller = TripController()
        controller.handle(.requestRide)
        controller.handle(.tripCancelled(reason: "User cancelled"))
        XCTAssertEqual(controller.state, .cancelled(reason: "User cancelled"))
    }

    func testIgnoresInvalidTransition() {
        let controller = TripController()
        controller.handle(.driverAssigned(name: "Sam", eta: 3))
        XCTAssertEqual(controller.state, .idle)

        controller.handle(.requestRide)
        controller.handle(.tripCompleted)
        XCTAssertEqual(controller.state, .requesting)
    }

    func testCompletedIsTerminal() {
        let controller = TripController()
        controller.handle(.requestRide)
        controller.handle(.driverAssigned(name: "Sam", eta: 2))
        controller.handle(.tripStarted)
        controller.handle(.tripCompleted)
        controller.handle(.requestRide)
        XCTAssertEqual(controller.state, .completed)
    }
}
