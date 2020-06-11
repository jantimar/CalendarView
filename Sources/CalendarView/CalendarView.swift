import SwiftUI

public struct CalendarView: View {
    @ObservedObject public var viewModel: CalendarViewModel

    public var body: some View {
        VStack {
            header
            weekdaySymbols
            MonthView(weeks: viewModel.current.weeks)
                .frame(maxWidth: .infinity)
                .animation(.default)
        }
    }

    public init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
    }

    private var header: some View {
        HStack {
            Button(action: viewModel.previousPage) {
                Text(" < ")
                    .fontWeight(.bold)
            }
            Spacer()
            Text(viewModel.formattedDate)
            Spacer()
            Button(action: viewModel.nextPage) {
                Text(" > ")
                    .fontWeight(.bold)
            }
        }
    }

    private var weekdaySymbols: some View {
        HStack {
            ForEach(viewModel.weekdaySymbols, id: \.self) {
                Text($0)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity)
            }
        }.frame(maxWidth: .infinity)
    }
}

public struct CalendarView_Previews: PreviewProvider {
    static public var previews: some View {
        let dayTimeInterval: TimeInterval = 24 * 60 * 60
        let viewModel = CalendarViewModel(heighlighted: [.init(timeIntervalSinceNow: dayTimeInterval)])
        return CalendarView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
