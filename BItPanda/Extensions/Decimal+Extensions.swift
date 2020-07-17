//
//  Decimal+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 05/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension Decimal {
    var twoDigitsString: String {
        return NumberFormatter.twoDigits.string(for: self) ?? ""
    }
    
    var doubleValue: Double {
        return (self as NSDecimalNumber).doubleValue
    }
}
