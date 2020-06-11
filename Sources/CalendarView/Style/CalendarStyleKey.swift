import SwiftUI

/// Environment key to set `CalendarStyleProtocol`
public struct CalendarStyleKey: EnvironmentKey {
    public static let defaultValue: CalendarStyleProtocol = CalendarStyle()
}

public extension EnvironmentValues {
    var calendarStyle: CalendarStyleProtocol {
        get { self[CalendarStyleKey.self] }
        set { self[CalendarStyleKey.self] = newValue }
    }
}
