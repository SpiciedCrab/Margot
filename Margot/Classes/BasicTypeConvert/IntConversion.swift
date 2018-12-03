//
//  IntConversion.swift
//  Margot
//
//  Created by CatHarly on 2018/11/30.
//

import Foundation

// MARK: - Int Extension Conversions
extension Int: LazyCaculatable {
    
    /// Int -> UInt
    public var uInt: UInt {
        return UInt(self)
    }
    
    /// Int -> Double
    public var double: Double {
        return Double(self)
    }
    
    /// Int -> Float
    public var float: Float {
        return Float(self)
    }
    
    /// Int -> CGFloat
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    /// Int -> String
    public var string: String {
        return "\(self)"
    }
}

// MARK: - Int? Extensions
public extension Optional where Wrapped == Int {
    
    /// Int? -> Int
    public var defaultWithZero: Int {
        return defaultValue(with: 0)
    }
}

// MARK: - UInt32 Exension COnversions
public extension UInt32 {
    public var int: Int {
        return Int(self)
    }
}
