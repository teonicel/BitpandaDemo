//
//  UITableViewCell+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 02/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

public extension UITableViewCell {
  static var reuseKey: String {
    return String(describing: self)
  }
}
