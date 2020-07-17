//
//  SceneModuleFactory.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation

protocol SceneModuleFactoryProtocol {
    func makeAssetsListModule() -> (vc: Presentable, nav: AssetsListNavigable)
    func makeWalletsModule() -> (vc: Presentable, nav: WalletsListNavigable)
}

final public class SceneModuleFactory: SceneModuleFactoryProtocol {
    func makeAssetsListModule() -> (vc: Presentable, nav: AssetsListNavigable) {
        final class AssetsListNav: AssetsListNavigable {
            var goToError: ((Error) -> Void)?
        }
        let nav = AssetsListNav()
        let dataProvider = DataProvider.shared
        let vm = AssetsListPresenter(dataProvider: dataProvider, navigation: nav)
        let vc = AssetsListViewController()
        vm.managedView = vc
        vc.presenter = vm
        return (vc, nav)
    }
    
    func makeWalletsModule() -> (vc: Presentable, nav: WalletsListNavigable) {
        final class WalletsListNav: WalletsListNavigable {
            var goToError: ((Error) -> Void)?
        }
        let nav = WalletsListNav()
        let dataProvider = DataProvider.shared
        let vm = WalletsListPresenter(dataProvider: dataProvider, navigation: nav)
        let vc = WalletsListViewController()
        vm.managedView = vc
        vc.presenter = vm
        return (vc, nav)
    }
    
    
//    func makeExchangeListModule() -> (vc: Presentable, nav: CurrencyListNavigable) {
//        final class CurrencyListNav: CurrencyListNavigable {
//            var goToError: ((Error) -> Void)?
//            var goToCurrencyHistory: (() -> Void)?
//            var goToSettings: (() -> Void)?
//        }
//        let nav = CurrencyListNav()
//        let connection = ExchangeConnection()
//        let vm = CurrencyListViewModel(connection: connection, navigation: nav)
//        let vc = CurrencyListViewController()
//        vm.managedView = vc
//        vc.viewModel = vm
//        return (vc, nav)
//    }
//
//    func makeExchangeHistoryModule() -> (vc: Presentable, nav: CurrencyHistoryNavigable) {
//        final class CurrencyHistoryNav: CurrencyHistoryNavigable {
//            var goBack: (() -> Void)?
//            var goToError: ((Error) -> Void)?
//        }
//        let nav = CurrencyHistoryNav()
//        let connection = ExchangeConnection()
//        let vm = CurrencyHistoryViewModel(connection: connection, navigation: nav)
//        let vc = CurrencyHistoryViewController()
//        vm.managedView = vc
//        vc.viewModel = vm
//        return (vc, nav)
//    }
//
//    func makeSettingsModule() -> (vc: Presentable, nav: SettingsNavigable) {
//        final class SettingstNav: SettingsNavigable {
//            var goBack: (() -> Void)?
//        }
//        let nav = SettingstNav()
//        let vm = SettingsViewModel(navigation: nav)
//        let vc = SettingsViewController()
//        vm.managedView = vc
//        vc.viewModel = vm
//        return (vc, nav)
//    }
}
