//
//  NumberFormatter+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 03/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    static let twoDigits: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.fractionDigits = 2
        return numberFormatter
    }()
    
    static let fourDigits: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.fractionDigits = 4
        return numberFormatter
    }()
    
    public var fractionDigits: Int {
        get {
            return minimumFractionDigits
        }
        set {
            minimumFractionDigits = newValue
            maximumFractionDigits = newValue
        }
    }
}
