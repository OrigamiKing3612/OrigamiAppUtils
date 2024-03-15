import SwiftUI

extension View {
    public func red() -> some View {
        self.foregroundStyle(.red)
    }
    public func orange() -> some View {
        self.foregroundStyle(.orange)
    }
    public func yellow() -> some View {
        self.foregroundStyle(.yellow)
    }
    public func green() -> some View {
        self.foregroundStyle(.green)
    }
    public func mint() -> some View {
        self.foregroundStyle(.mint)
    }
    public func teal() -> some View {
        self.foregroundStyle(.teal)
    }
    public func cyan() -> some View {
        self.foregroundStyle(.cyan)
    }
    public func blue() -> some View {
        self.foregroundStyle(.blue)
    }
    public func indigo() -> some View {
        self.foregroundStyle(.indigo)
    }
    public func purple() -> some View {
        self.foregroundStyle(.purple)
    }
    public func pink() -> some View {
        self.foregroundStyle(.pink)
    }
    public func brown() -> some View {
        self.foregroundStyle(.brown)
    }
    public func gray() -> some View {
        self.foregroundStyle(.gray)
    }
    public func placeholderText() -> some View {
        self.gray()
    }
    /// Use this if:
    /// .light ? .white : .black
    /// .dark ? .black : .white
    public func colorScheme() -> some View {
        self.modifier(ColorSchemeText { $0 ? .white : .black })
    }
    /// Use this if:
    /// .light ? .black : .white
    /// .dark ? .white : .black
    public func inverseColorScheme() -> some View {
        self.modifier(ColorSchemeText { $0 ? .black : .white })
    }
    public func white() -> some View {
        self.foregroundStyle(.white)
    }
    public func black() -> some View {
        self.foregroundStyle(.black)
    }
    public func warningText() -> some View {
        self.bold().red()
    }
}

public struct ColorSchemeText: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    let color: (Bool) -> Color
    
    public func body(content: Content) -> some View {
        content.foregroundStyle(color(colorScheme == .light))
    }
}

extension View {
    public func macOS(_ modifier: (Self) -> some View) -> some View {
#if os(macOS)
        modifier(self)
#else
        self
#endif
    }
    public func iOS(_ modifier: (Self) -> some View) -> some View {
#if os(iOS)
        modifier(self)
#else
        self
#endif
    }
    public func watchOS(_ modifier: (Self) -> some View) -> some View {
#if os(watchOS)
        modifier(self)
#else
        self
#endif
    }
    public func tvOS(_ modifier: (Self) -> some View) -> some View {
#if os(tvOS)
        modifier(self)
#else
        self
#endif
    }
    public func visionOS(_ modifier: (Self) -> some View) -> some View {
#if os(visionOS)
        modifier(self)
#else
        self
#endif
    }
}

