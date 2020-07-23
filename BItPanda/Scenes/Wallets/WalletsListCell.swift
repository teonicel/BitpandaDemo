//
//  WalletListCell.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import UIKit

class WalletsListCell: UITableViewCell {
    public let iconView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        return view
    }()
    public let walletLabel: UILabel = .exchangeDefault(textAlignment: .left)
    
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
        stackView.spacing = 8
        
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(walletLabel)
        stackView.addArrangedSubview(amountLabel)
        
        layoutIfNeeded()
    }
    
    public func config(with data: Wallet) {
        let isDark = traitCollection.userInterfaceStyle == .dark
        let isBackgroundChanged = data.type == .fiatWallet || data.isDefault
        iconView.sd_setImage(with: URL(string: SymbolsIcons.retrieveUrlStr(for: data.symbol, isDark: isDark && isBackgroundChanged)), completed: nil)
        walletLabel.text = "\(data.name) (\(data.symbol))"
        amountLabel.text = data.balance.twoDigitsString
        walletLabel.sizeToFit()
        amountLabel.sizeToFit()
        if data.type == .fiatWallet {
            backgroundColor = .systemTeal
        }
        if data.isDefault {
            backgroundColor = .systemGreen
        }
        alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1
        }
    }
    
    override func prepareForReuse() {
        iconView.image = nil
        walletLabel.text = nil
        amountLabel.text = nil
        backgroundColor = .systemGray6
    }
}
