//
//  AppDelegate.swift
//  BestBreweries
//
//  Created by Александр on 18.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let currentVC = ViewController()
        let navigationController = UINavigationController(rootViewController: currentVC)
        navigationController.navigationBar.shadowImage = UIImage()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }
    
}

