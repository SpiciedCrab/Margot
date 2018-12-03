//
//  Conversion.swift
//  Margot
//
//  Created by CatHarly on 2018/11/29.
//

import Foundation

public extension String {
    
    /// String -> Double
    public var double: Double {
        return Margot
            .formatters
            .numberFormatter
            .number(from: self) as? Double ?? 0
    }
}

public extension Optional {
    func defaultValue(with value: Wrapped) -> Wrapped {
        return self ?? value
    }
}
