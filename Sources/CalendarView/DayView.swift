import SwiftUI

struct Day {
    let number: Int
    var isHeighlighted = false
    var isSelected = false
    var isEnabled = true
    var isCurrent = false
    var onSelect: (() -> Void) = {}
}

struct DayView: View {
    let day: Day

    @Environment(\.calendarStyle) private var style: CalendarStyleProtocol

    var body: some View {
        ZStack {
            Text("\(day.number)")
                .font(.system(size: 14))
                .foregroundColor(day.isCurrent ? style.currentDay : style.day)
                .frame(width: 30, height: 30)
                .overlay(
                    Circle()
                        .stroke(
                            style.selected,
                            lineWidth: day.isSelected ? 1 : 0
                    )
            )
            if day.isHeighlighted {
                Circle()
                    .frame(width: 4, height: 4)
                    .offset(x: 0, y: 12)
                    .foregroundColor(style.heighlighted)
            }
        }
        .padding(4)
        .background(style.background)
        .opacity(day.isEnabled ? 1 : 0.25)
        .onTapGesture(perform: day.onSelect)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayView(day: Day(number: 10))
            DayView(day: Day(number: 22, isHeighlighted: true))
            DayView(day: Day(number: 22, isSelected: true))
            DayView(day: Day(number: 23, isCurrent: true))
            DayView(day: Day(number: 13, isHeighlighted: true, isSelected: true))
            DayView(day: Day(number: 31, isEnabled: false))
        }
        .previewLayout(.sizeThatFits)
    }
}
