import SwiftUI

/// Protocol to define calendar style
public protocol CalendarStyleProtocol {
    var day: Color? { get }
    var currentDay: Color { get }
    var selected: Color { get }
    var heighlighted: Color { get }
    var background: Color { get }

    var nextPage: String { get }
    var previousPage: String { get }
    var button: Color { get }
    var buttonPedding: CGFloat { get }
}

/// Default values
public extension CalendarStyleProtocol {
    var day: Color? { nil }
    var currentDay: Color { .blue }
    var selected: Color { .blue }
    var heighlighted: Color { .blue }
    var background: Color { .clear }

    var nextPage: String { ">" }
    var previousPage: String { "<" }
    var button: Color { .blue }
    var buttonPedding: CGFloat { 8 }
}

/// CalendarStyle with default values
public struct CalendarStyle: CalendarStyleProtocol {}
