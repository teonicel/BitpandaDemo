//
//  Array+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 07/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach {
            if !uniqueValues.contains($0) {
                uniqueValues.append($0)
            }
        }
        return uniqueValues
    }
}
