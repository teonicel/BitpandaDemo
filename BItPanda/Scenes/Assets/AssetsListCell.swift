//
//  AssetListCell.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

class AssetsListCell: UITableViewCell {
    static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.fractionDigits = 4
        return numberFormatter
    }()
    
    public let iconView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        return view
    }()
    public let nameLabel: UILabel = .exchangeDefault(textAlignment: .left)
    
    public let amountLabel: UILabel = .exchangeDefault(textAlignment: .right)
    
    private let stackView: UIStackView = .horizontal()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        contentView.addSubview(stackView)
        stackView.snapMargins(to: contentView, edges: UIEdgeInsets(margin: 10))
        stackView.spacing = 16
        
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(amountLabel)
        
        layoutIfNeeded()
    }
    
    public func config(with data: Asset) {
        let nf = AssetsListCell.numberFormatter
        nf.fractionDigits = data.precision
        iconView.sd_setImage(with: URL(string: data.iconWhite), completed: nil)
        nameLabel.text = "\(data.name) (\(data.symbol))"
        amountLabel.text = nf.string(for: data.averagePrice)
        nameLabel.sizeToFit()
        amountLabel.sizeToFit()
        alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1
        }
    }
    
    override func prepareForReuse() {
        iconView.image = nil
        nameLabel.text = nil
        amountLabel.text = nil
        backgroundColor = .systemGray6
    }
}
