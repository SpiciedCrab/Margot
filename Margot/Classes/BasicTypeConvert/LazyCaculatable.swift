//
//  LazyCaculatable.swift
//  Margot
//
//  Created by CatHarly on 2018/12/2.
//

import Foundation

/// Caculatable for operators
// let x: Int = 0
// let y: Double = 0.0
// let c: CGFloat = 0.0
/// Avoiding: Int(x) + Int(y) + Int(c)
public protocol LazyCaculatable {
    var double: Double { get }
}

/// Lazy Plus
///
/// - Parameters:
///   - lhs: lhn
///   - rhs: rhs
/// - Returns: result
public func + (lhs: LazyCaculatable, rhs: LazyCaculatable) -> Double {
    return lhs.double + rhs.double
}

/// Lazy Minus
///
/// - Parameters:
///   - lhs: lhn
///   - rhs: rhs
/// - Returns: result
public func - (lhs: LazyCaculatable, rhs: LazyCaculatable) -> Double {
    return lhs.double - rhs.double
}

/// Lazy Multiply
///
/// - Parameters:
///   - lhs: lhn
///   - rhs: rhs
/// - Returns: result
public func * (lhs: LazyCaculatable, rhs: LazyCaculatable) -> Double {
    return lhs.double * rhs.double
}

/// Lazy Division
///
/// - Parameters:
///   - lhs: lhn
///   - rhs: rhs
/// - Returns: result
public func / (lhs: LazyCaculatable, rhs: LazyCaculatable) -> Double {
    if rhs.double == 0 {
        fatalError("rhs == 0")
    }
    return lhs.double / rhs.double
}
