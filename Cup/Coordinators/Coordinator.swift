//
//  Coordinator.swift
//  Cup
//
//  Created by Henrique Jardim on 06/07/20.
//  Copyright © 2020 Jardim. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator : class{
    var childCoordinators : [Coordinator] { get set}
    var navigationController : UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    func store(newCoordinator : Coordinator){
        childCoordinators.append(newCoordinator)
    }
    
    func free(coordinatorToRemove : Coordinator){
        childCoordinators = childCoordinators.filter { $0 !== coordinatorToRemove }
    }
}
