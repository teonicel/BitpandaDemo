//
//  AssetsListPresenter.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

public protocol AssetsListNavigable: ErrorNavigable {
}

public protocol AssetsListViewProtocol: AnyObject {
    var presenter: AssetsListPresenterProtocol? { get set }
    func updateView()
}

public protocol AssetsListPresenterProtocol {
    var managedView: AssetsListViewProtocol? { get set }
    func viewDidLoad()
    func viewDidAppear()
    func selectAssetsFor(index: Int)
    var assetNumber: Int { get }
    func assetAt(indexPath: IndexPath) -> Asset?
    var assetsTypesTitles: [String] { get }
}

final public class AssetsListPresenter: AssetsListPresenterProtocol {
    public weak var managedView: AssetsListViewProtocol?
    private var navigation: AssetsListNavigable
    private var dataProvider: DataProviderProtocol
    private var assetsTypes = AssetType.allCases
    public var assetsTypesTitles: [String] {
        return assetsTypes.map { $0.rawValue.capitalizingFirstLetter() }
    }
    
    private var currentSelectedData = [Asset]()
    private var lastIndex = 0
    
    init(dataProvider: DataProviderProtocol, navigation: AssetsListNavigable) {
        self.navigation = navigation
        self.dataProvider = dataProvider
    }
    
    public func viewDidLoad() {
        selectAssetsFor(index: lastIndex)
    }
    
    public func viewDidAppear() {
        selectAssetsFor(index: lastIndex)
    }
    
    public func selectAssetsFor(index: Int) {
        lastIndex = index
        let type = assetsTypes[safe: index] ?? .cryptocoin
        switch type {
        case .cryptocoin:
            currentSelectedData = dataProvider.masterData.cryptocoins
        case .commodity:
            currentSelectedData = dataProvider.masterData.commodities
        case .fiat:
            currentSelectedData = dataProvider.masterData.fiats.filter { $0.hasWallets == true }
        }
        managedView?.updateView()
    }
    
    public func assetAt(indexPath: IndexPath) -> Asset? {
        currentSelectedData[safe: indexPath.row]
    }
    public var assetNumber: Int {
        return currentSelectedData.count
    }
}
