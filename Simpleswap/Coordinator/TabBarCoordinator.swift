//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit
final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var tabBarController: TabBarViewController
    var childCoordinators: [Coordinator] = []
    
    init(tabBarController: TabBarViewController, navigationController: UINavigationController) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
    }
    func start() {
        print("TabBarCoordinator")
        let homeNavigationController = UINavigationController()
        let marketNavigationController = UINavigationController()
        let tradeNavigationController = UINavigationController()
        let favoriteNavigationController = UINavigationController()
        
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        let marketViewController = MarketViewController(viewModel: MarketViewModel())
        let tradeViewController = TradeViewController()
        let favoriteViewController = FavoriteViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: nil)
        marketViewController.tabBarItem = UITabBarItem(title: "Market", image: UIImage(named: "market"), selectedImage: nil)
        tradeViewController.tabBarItem = UITabBarItem(title: "Trade", image: UIImage(named: "trade"), selectedImage: nil)
        favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), selectedImage: nil)
        homeNavigationController.viewControllers = [homeViewController]
        marketNavigationController.viewControllers = [marketViewController]
        tradeNavigationController.viewControllers = [tradeViewController]
        favoriteNavigationController.viewControllers = [favoriteViewController]

        homeNavigationController.navigationBar.isHidden = true
        marketNavigationController.navigationBar.isHidden = true
        tradeNavigationController.navigationBar.isHidden = true
        favoriteNavigationController.navigationBar.isHidden = true
        tabBarController.viewControllers = [
            homeNavigationController,
            marketNavigationController,
            tradeNavigationController,
            favoriteNavigationController
        ]
        let homeCoordinator = HomeCoordinator(tabBarController: tabBarController)
        homeCoordinator.navigationController = homeNavigationController
        homeViewController.coordinator = homeCoordinator
        
        childCoordinators = [
            homeCoordinator,
            MarketCoordinator(navigationController: marketNavigationController),
            TradeCoordinator(navigationController: tradeNavigationController),
            FavoriteCoordinator(navigationController: favoriteNavigationController)
        ]
        childCoordinators.forEach { coordinator in
            coordinator.start()
        }
    }
    func openMenuViewController() {
        let menuViewController = MenuViewController()
        navigationController?.pushViewController(menuViewController, animated: true)
    }
}
