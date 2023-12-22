//
//  AppDelegate.swift
//  Home
//
//  Created by wendytamara on 12/18/2023.
//  Copyright (c) 2023 wendytamara. All rights reserved.
//

import UIKit
import CorePokeDex

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        let navigationController = UINavigationController()
        appCoordinator = AppCoordinator()
        appCoordinator?.navigationController = navigationController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator?.navigationController
        
        appCoordinator?.start()

        window?.makeKeyAndVisible()

        return true
    }

}
