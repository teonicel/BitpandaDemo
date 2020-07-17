//
//  AppCoordinator.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation
import UIKit

final public class AppCoordinator: Coordinator {
    let sceneFactory: SceneModuleFactoryProtocol
    let tabBarController: UITabBarController
    
    init(router: UITabBarController, sceneFactory: SceneModuleFactoryProtocol) {
        self.sceneFactory = sceneFactory
        self.tabBarController = router
        super.init(router: nil)
    }
    
    override public func goToError(error: Error) {
        let alertViewController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        tabBarController.present(alertViewController, animated: true, completion: nil)
    }
    
    override func start() {
        var assetsModule = sceneFactory.makeAssetsListModule()
        assetsModule.nav.goToError = { [weak self] error in
            self?.goToError(error: error)
        }
        
        var walletsModule = sceneFactory.makeWalletsModule()
        walletsModule.nav.goToError = { [weak self] error in
            self?.goToError(error: error)
        }
        
        guard let assetsViewController = assetsModule.vc.toPresent(),
            let walletsViewController = walletsModule.vc.toPresent()else { return }
        assetsViewController.tabBarItem = UITabBarItem(title: "Assets", image: nil, selectedImage: nil)
        walletsViewController.tabBarItem = UITabBarItem(title: "Wallets", image: nil, selectedImage: nil)
        
        tabBarController.setViewControllers([assetsViewController, walletsViewController], animated: true)
    }
}
