//
//  DateFormatter.swift
//  ExchangeDemo
//
//  Created by teo on 03/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let dateOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let dayMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        return formatter
    }()
}
