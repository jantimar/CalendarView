import SwiftUI

/// Protocol to define calendar style
public protocol CalendarStyleProtocol {
    var day: Color? { get }
    var currentDay: Color { get }
    var selected: Color { get }
    var heighlighted: Color { get }
    var background: Color { get }
}

/// Default values
public extension CalendarStyleProtocol {
    var day: Color? { nil }
    var currentDay: Color { .blue }
    var selected: Color { .blue }
    var heighlighted: Color { .blue }
    var background: Color { .clear }
}

/// CalendarStyle with default values
public struct CalendarStyle: CalendarStyleProtocol {}
