//
//  Gruable.swift
//  Gru
//
//  Created by CatHarly on 2018/11/29.
//

import Foundation

public struct Gru<Child> {
    public let child: Child
    
    public init(_ child: Child) {
        self.child = child
    }
}

public protocol Gruable {
    associatedtype GruType
    
    static var gru: Gru<GruType>.Type { get }
    
    var gru: Gru<GruType> { get }
}

public extension Gruable {
    
    public static var gru: Gru<Self>.Type {
        return Gru<Self>.self
    }
    
    public var gru: Gru<Self> {
        return Gru(self)
    }
}

extension NSObject: Gruable {

}

