//
//  DoubleConversion.swift
//  Margot
//
//  Created by CatHarly on 2018/11/30.
//

import Foundation

// MARK: - Double Extension Conversions
extension Double: LazyCaculatable {
    
    public var double: Double {
        return self
    }
    
    /// Double -> Int
    public var int: Int {
        return Int(self)
    }
    
    /// Double -> float
    public var float: Float {
        return Float(self)
    }
    
    /// Double -> cgFloat
    public var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    /// Double -> String
    public var string: String {
        return "\(self)"
    }
    
    /// Double -> String with 2 digits  e.g: 22.2222 -> "22.22"
    public var twoDigitString: String {
        return stringValue(2)
    }
    
    /// Double -> currency e.g: 2222222.22 -> "2,222,222.22"
    public var currencyString: String {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    /// Double to string
    ///
    /// - Parameter digits: fraction digits
    /// - Returns: string value of double
    public func stringValue(_ digits: Int) -> String {
        return String(format: "%.\(digits)f", self as CVarArg)
    }
}

// MARK: - Double? Extensions
public extension Optional where Wrapped == Double {
    
    /// Double? -> Double
    public var defaultWithZero: Double {
        return defaultValue(with: 0)
    }
}
