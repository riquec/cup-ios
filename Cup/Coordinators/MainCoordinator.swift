//
//  MainCoordinator.swift
//  Cup
//
//  Created by Henrique Jardim on 06/07/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, NicknameCoordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController.instantiate()
        viewController.nicknameViewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func goToCategory(){
        let viewController = CategoryViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
    }
}
