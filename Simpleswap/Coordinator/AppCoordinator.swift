//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//
import UIKit
class AppCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    func start() {
        let tabBarView = TabBarViewController()
        let homeCoordinator = HomeCoordinator(navCon: UINavigationController())
        let marketCoordinator = MarketCoordinator(navCon: UINavigationController())
        let tradeCoordinator = TradeCoordinator(navCon: UINavigationController())
        let favoriteCoordinator = FavoriteCoordinator(navCon: UINavigationController())
        tabBarView.delegate = self
        tabBarView.viewControllers = [
            homeCoordinator.navigationController,
            marketCoordinator.navigationController,
            favoriteCoordinator.navigationController,
            tradeCoordinator.navigationController
        ]
        
        let coordinators: [Coordinator] = [homeCoordinator, marketCoordinator, tradeCoordinator, favoriteCoordinator]
        coordinators.forEach { coordinator in
            coordinator.start()
        }
        navigationController.setViewControllers([tabBarView], animated: true)
    }
}
