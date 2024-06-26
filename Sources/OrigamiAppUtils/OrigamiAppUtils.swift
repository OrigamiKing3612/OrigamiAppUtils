import Foundation

extension Array where Element: Nameable {
    public func find(name: Element.Name) -> Bool {
        for item in self {
            if item.name == name {
                return true
            }
        }
        return false
    }
    public func find(name: Element.Name) -> Element? {
        for item in self {
            if item.name == name {
                return item
            }
        }
        return nil
    }
    public func getIndex(name: Element.Name) -> Int? {
        for (index, item) in self.enumerated() {
            if item.name == name {
                return index
            }
        }
        return nil
    }
}
extension Array where Element: Equatable {
    public func removeDuplicates() -> [Element] {
        self.reduce(into: [Element]()) { result, element in
            if !result.contains(where: { $0 == element }) {
                result.append(element)
            }
        }
    }
}
extension Array where Element: Identifiable {
    public func find(id: Element.ID) -> Bool {
        for item in self {
            if item.id == id {
                return true
            }
        }
        return false
    }
    public func find(id: Element.ID) -> Element? {
        for item in self {
            if item.id == id {
                return item
            }
        }
        return nil
    }
    public func getIndex(id: Element.ID) -> Int? {
        for (index, item) in self.enumerated() {
            if item.id == id {
                return index
            }
        }
        return nil
    }
}

extension String {
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    public var isValidEmail: Bool {
        isValidEmail(self)
    }
}

public func getDateString(_ date: Date, dateFormatType: DateFormats = .MMddyy) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormatType.rawValue
    return dateFormatter.string(from: date)
}
public func getDate(_ dateString: String, dateFormatType: DateFormats = .MMddyy) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormatType.rawValue
    return dateFormatter.date(from: dateString) ?? .now
}

public enum DateFormats: String {
    case MMddyy = "MM-dd-yy"
    case MMdd = "MM-dd"
    case MMyy = "MM-yy"
}
