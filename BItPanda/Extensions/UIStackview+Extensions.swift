//
//  UIStackview+Extensions.swift
//  ExchangeDemo
//
//  Created by teo on 05/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

extension UIStackView {
    public static func horizontalEqual() -> UIStackView {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }
    
    public static func horizontal() -> UIStackView {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.alignment = .fill
        return stack
    }
}
