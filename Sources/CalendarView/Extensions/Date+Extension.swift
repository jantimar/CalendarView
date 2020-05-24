import Foundation

extension Date {
    /// Compare two dats if it is from same day, hour, minutes and seconds can be different
    /// - Parameter date: Date to compare
    func isEqualDay(_ date: Date) -> Bool {
        let secondDateComponents = Calendar
                   .current
                   .dateComponents(
                       [.year, .month, .day],
                       from: date
               )

        let components = Calendar
                   .current
                   .dateComponents(
                       [.year, .month, .day],
                       from: self
               )

        return secondDateComponents == components
    }

    var month: Int {
        Calendar
            .current
            .component(.month, from: self)
    }

    var year: Int {
        Calendar
            .current
            .component(.year, from: self)
    }

    var numberOfDaysInMonth: Int {
        Calendar
            .current
            .range(of: .day, in: .month, for: self)?
            .count ?? 0
    }

    /// Return weekd day from first day of month, Monday - 1, Tuesday - 2 ... Sunday - 7
    var weekdayOfMonth: Int {
        Calendar
            .current
            .component(.weekday, from: self)
    }

    /// Create new Date only from month and year
    /// - Parameters:
    ///   - year: Year of new created Date
    ///   - month: Month of new created Date
    ///   - day: Day of new created Date
    init?(year: Int, month: Int, day: Int = 1) {
        guard let date = Calendar
            .current
            .date(
                from: DateComponents(year: year, month: month, day: day)
            ) else { return nil }
        self = date
    }
}
