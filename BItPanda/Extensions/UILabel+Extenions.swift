//
//  UILabel+Extenions.swift
//  ExchangeDemo
//
//  Created by teo on 05/04/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

extension UILabel {
    public static func exchangeDefault(textAlignment: NSTextAlignment = .center, color: UIColor = .black, size: CGFloat = 16) -> UILabel {
        let label = UILabel(frame: .zero)
        label.textAlignment = textAlignment
        label.font = .systemFont(ofSize: size)
        label.textColor = .label
        return label
    }
}
