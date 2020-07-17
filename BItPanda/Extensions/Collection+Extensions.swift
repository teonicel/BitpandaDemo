//
//  Collection+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 02/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

extension Collection {
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  public subscript (safe index: Index) -> Element? {
    
    return indices.contains(index) ? self[index] : nil
  }
}
