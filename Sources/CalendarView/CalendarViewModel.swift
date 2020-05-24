import SwiftUI

struct Page {
    let month: Int
    let year: Int
    let heighlighted: [Date]
    let selected: Date?
    var select: ((Date) -> Void) = { _ in }

    var date: Date? {
        Date(year: year, month: month)
    }

    var weeks: [Week] {
        guard let date = date else { return [] }
        let firstDayInMonth = date.weekdayOfMonth - 1 // -1 because first day of week is 1 and not 0

        // Add days from previous month
        let previousMonthDays = self.previousMonthDays
        let lastPreviousMonthVisibleDays = previousMonthDays - firstDayInMonth + 1
        let daysInPreviousMonth = (min(previousMonthDays, lastPreviousMonthVisibleDays)...previousMonthDays)
            .map { Day(number: $0, isEnabled: false) }

        // Add curent month days
        let numberOfDaysInMonth = date.numberOfDaysInMonth
        let daysInCurrentMonth = (1...numberOfDaysInMonth)
            .map(dayModelFor(day:))

        // Add days from next month
        let missingDaysInNextMonth = 42 - (firstDayInMonth + numberOfDaysInMonth) // 42 is constants number of days for every page to fix jump when number of weeks will changed
        let daysInNextMonth = (1...missingDaysInNextMonth)
            .map { Day(number: $0, isEnabled: false) }

        let daysOnPage = daysInPreviousMonth + daysInCurrentMonth + daysInNextMonth

        var weeks = [Week]()
        for firstDayInWeek in stride(from: 0, to: 42, by: 7) {
            let daysInWeek = daysOnPage[firstDayInWeek..<(firstDayInWeek + 7)]

            weeks.append(
                Week(days: Array(daysInWeek))
            )
        }

        return weeks
    }

    private var previousMonthDays: Int {
        if month == 1 {
            return Date(year: 12, month: year - 1)?
                .numberOfDaysInMonth ?? 0
        } else {
            return Date(year: month - 1, month: year)?
                .numberOfDaysInMonth ?? 0
        }
    }

    private func dayModelFor(day: Int) -> Day {
        let today = Date()
        let dayDate = Date(year: year, month: month, day: day) ?? today

        let isHeighlighted = heighlighted
            .first(where: { $0.isEqualDay(dayDate) }) != nil
        return Day(
            number: day,
            isHeighlighted: isHeighlighted,
            isSelected: selected?.isEqualDay(dayDate) == true,
            isCurrent: today.isEqualDay(dayDate),
            onSelect: { self.select(dayDate) }
        )
    }
}

final public class CalendarViewModel: ObservableObject {
    @Published public var selectedDate: Date?
    @Published var current: Page

    var formattedDate: String { "\(current.month). \(current.year)" }
    private(set) lazy var weekdaySymbols: [String] = DateFormatter().shortWeekdaySymbols

    init(
        today: Date = .init(),
        heighlighted: [Date] = .init(),
        selectedDate: Date? = nil
    ) {
        self.heighlighted = heighlighted
        self.today = today
        self.current = Page(
            month: today.month,
            year: today.year,
            heighlighted: heighlighted,
            selected: selectedDate
        )
        self.current.select = update(date:)
    }

    private let heighlighted: [Date]
    private let today: Date

    func nextPage() {
        if current.month == 12 {
            reloadPage(
                month: 1,
                year: current.year + 1
            )
        } else {
            reloadPage(
                month: current.month + 1,
                year: current.year
            )
        }
    }

    func previousPage() {
        if current.month == 1 {
            reloadPage(
                month: 12,
                year: current.year - 1
            )
        } else {
            reloadPage(
                month: current.month - 1,
                year: current.year
            )
        }
    }

    private func update(date: Date) {
        selectedDate = date
        reloadPage(
            month: current.month,
            year: current.year
        )
    }

    private func reloadPage(
        month: Int,
        year: Int
    ) {
        current = Page(
            month: month,
            year: year,
            heighlighted: heighlighted,
            selected: selectedDate,
            select: update(date:)
        )
    }
}
