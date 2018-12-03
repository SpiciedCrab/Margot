//
//  CGFloatConversion.swift
//  Gru
//
//  Created by CatHarly on 2018/12/2.
//

import Foundation

// MARK: - CGFloat Extension Conversions
extension CGFloat: LazyCaculatable {
    
    /// CGFloat -> Int
    public var int: Int {
        return Int(self)
    }
    
    /// CGFloat -> Double
    public var double: Double {
        return Double(self)
    }
    
    /// CGFloat -> Float
    public var float: Float {
        return Float(self)
    }
}

// MARK: - CGFloat? Extensions
public extension Optional where Wrapped == CGFloat {
    
    /// CGFloat? -> CGFloat
    public var defaultWithZero: CGFloat {
        return defaultValue(with: 0)
    }
}
