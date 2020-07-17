//
//  WalletsListPresenters.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

public protocol WalletsListNavigable: ErrorNavigable {
}

public protocol WalletsListViewProtocol: AnyObject {
    var presenter: WalletsListPresenterProtocol? { get set }
    func updateView()
}

public protocol WalletsListPresenterProtocol {
    var managedView: WalletsListViewProtocol? { get set }
    var walletSectionsCount: Int { get }
    func walletsCountFor(section: Int) -> Int
    func walletTitleFor(section: Int) -> String
    func walletFor(indexPath: IndexPath) -> Wallet?
    func viewDidLoad()
    func viewDidAppear()
    
}

final public class WalletsListPresenter: WalletsListPresenterProtocol {
    public weak var managedView: WalletsListViewProtocol?
    private var navigation: WalletsListNavigable
    private var dataProvider: DataProviderProtocol
    
    private var walletSections = [WalletSection]()
    
    public var walletSectionsCount: Int {
        walletSections.count
    }
    
    init(dataProvider: DataProviderProtocol, navigation: WalletsListNavigable) {
        self.navigation = navigation
        self.dataProvider = dataProvider
    }
    
    public func viewDidLoad() {
        getData()
    }
    
    public func viewDidAppear() {
        getData()
    }
    
    @objc private func getData() {
        let wallets = dataProvider.masterData.wallets.sorted { $0.balance > $1.balance } .filter { !$0.isDeleted }
        walletSections.append(WalletSection(title: "Wallet", wallets: wallets))
        let comoditiesWallets = dataProvider.masterData.comoditiesWallets.sorted { $0.balance > $1.balance } .filter { !$0.isDeleted }
        walletSections.append(WalletSection(title: "Comodities Wallet", wallets: comoditiesWallets))
        let fialWallets = dataProvider.masterData.fialWallets.sorted { $0.balance > $1.balance } .filter { !$0.isDeleted }
        walletSections.append(WalletSection(title: "Fiat Wallet", wallets: fialWallets))
    }
    
    public func walletsCountFor(section: Int) -> Int {
        let section = walletSections[safe: section]
        return section?.wallets.count ?? 0
    }
    
    public func walletTitleFor(section: Int) -> String {
        return walletSections[safe: section]?.title.capitalizingFirstLetter() ?? ""
    }
    
    public func walletFor(indexPath: IndexPath) -> Wallet? {
        return walletSections[safe: indexPath.section]?.wallets[safe: indexPath.row]
    }
}

struct WalletSection {
    let title: String
    let wallets: [Wallet]
}
