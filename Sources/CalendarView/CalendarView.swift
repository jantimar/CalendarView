import SwiftUI

public struct CalendarView: View {
    @ObservedObject public var viewModel: CalendarViewModel
    @Environment(\.calendarStyle) private var style: CalendarStyleProtocol
    private let gestureTreshold: CGFloat =  50

    public var body: some View {
        VStack {
            header
            weekdaySymbols
            MonthView(weeks: viewModel.current.weeks)
                .frame(maxWidth: .infinity)
                .animation(.default)
                .gesture(
                    DragGesture(minimumDistance: gestureTreshold)
                        .onChanged {
                            switch $0.translation.width {
                            case gestureTreshold...: viewModel.nextPage()
                            case ..<(-gestureTreshold): viewModel.previousPage()
                            default: break
                            }
                        }
                )
        }
    }

    public init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
    }

    private var header: some View {
        HStack {
            Button(action: viewModel.previousPage) {
                Text(style.previousPage)
                    .foregroundColor(style.button)
                    .padding(.horizontal, style.buttonPedding)
            }
            Spacer()
            Text(viewModel.formattedDate)
            Spacer()
            Button(action: viewModel.nextPage) {
                Text(style.nextPage)
                    .foregroundColor(style.button)
                    .padding(.horizontal, style.buttonPedding)
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
