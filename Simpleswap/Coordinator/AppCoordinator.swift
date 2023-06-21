//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//
import UIKit
final class AppCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    var navigationController: UINavigationController?
    var tabBarController: TabBarViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = TabBarViewController()
        super.init()
    }
    
    func start() {
        print("AppCoordinator")
        
        let tabBarCoordinator = TabBarCoordinator(tabBarController: tabBarController, navigationController: navigationController!)
        tabBarController.coordinator = tabBarCoordinator
        tabBarCoordinator.start()
        
        navigationController?.setViewControllers([tabBarController], animated: true)
    }
}
