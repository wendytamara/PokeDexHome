//
//  AppCoordinator.swift
//  Home_Example
//
//  Created by Wendy Tamara Quispe Quispe on 18/12/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import CorePokeDex
import Home

class AppCoordinator: Coordinator {
    public var navigationController: UINavigationController?

    func start() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.navigationController = self.navigationController
        homeCoordinator.start()
    }
    
    func present(viewController: UIViewController) {
        
    }
}
