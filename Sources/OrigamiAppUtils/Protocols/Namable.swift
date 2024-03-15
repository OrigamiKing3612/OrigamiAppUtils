import Foundation

public protocol Nameable<Name>: Equatable {
    /// A type representing the stable name of the entity associated with
    /// an instance.
    associatedtype Name : Hashable
    
    /// The stable name of the entity associated with this instance.
    var name: Self.Name { get }
}
