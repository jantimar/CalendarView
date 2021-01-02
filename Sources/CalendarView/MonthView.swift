import SwiftUI

public struct MonthView: View {
    public let weeks: [Week]

    public var body: some View {
        VStack {
            ForEach(weeks, content: WeekView.init(week:))
        }
    }
}

struct MonthView_Previews: PreviewProvider {

    static var previews: some View {
        var weeks = [Week]()
        for week in 0...4 {
            var days = [Day]()
            for day in 1...7 {
                days.append(Day(number: week * 7 + day))
            }
            weeks.append(Week(days: days))
        }

        return MonthView(weeks: weeks)
            .previewLayout(.sizeThatFits)
    }
}
