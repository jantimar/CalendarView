import XCTest
@testable import CalendarView

final class CalendarViewTests: XCTestCase {

    static var allTests = [
        ("testGetWeek", testGetWeek),
    ]


    func testGetWeek() {
        let calendarViewModel = CalendarViewModel(
            today: Date(timeIntervalSince1970: 0),
            heighlighted: [],
            selectedDate: nil
        )

        // Get second week of week ( first is 0 )
        let week = calendarViewModel.week(of: 1)

        XCTAssertNotNil(week)
        XCTAssertEqual(week?.days.count, 7)
        XCTAssertEqual(week?.days.first?.number, 4)
    }
}
