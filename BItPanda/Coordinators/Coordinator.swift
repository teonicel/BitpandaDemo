//
//  Coordinator.swift
//  BItPanda
//
//  Created by teo on 17/07/2020.
//  Copyright © 2020 teonicel. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    func start()
}

public class Coordinator: CoordinatorProtocol {
    var childCoordinators = NSMutableOrderedSet()
    var router: UINavigationController
    
    init(router: UINavigationController?) {
        self.router = router ?? UINavigationController()
    }
    
    func start() {
        
    }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        childCoordinators.add(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator) {
        childCoordinators.remove(coordinator)
    }
}

public protocol ErrorNavigable {
    var goToError: ((Error) -> Void)? { get set }
}

extension Coordinator {
    @objc public func goToError(error: Error) {
        let alertViewController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        router.present(alertViewController, animated: true, completion: nil)
    }
}
