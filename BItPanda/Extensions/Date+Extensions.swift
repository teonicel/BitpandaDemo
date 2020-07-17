//
//  Date+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 05/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension Date {
    var dateOnly: String {
        return DateFormatter.dateOnly.string(from: self)
    }
    
    var dayMonth: String {
        return DateFormatter.dayMonth.string(from: self)
    }
}
