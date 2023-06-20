//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit
class TabBarCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: TabBarViewController
    init(navCon: UINavigationController, tabBarController: TabBarViewController) {
        self.navigationController = navCon
        self.tabBarController = tabBarController
    }
    func start() {
        let homeCoordinator = HomeCoordinator(navCon: navigationController)
        let marketCoordinator = MarketCoordinator(navCon: navigationController)
        let tradeCoordinator = TradeCoordinator(navCon: navigationController)
        let favoriteCoordinator = FavoriteCoordinator(navCon: navigationController)
        tabBarController.coordinator = self
        children = [homeCoordinator, marketCoordinator, tradeCoordinator, favoriteCoordinator]
        children.forEach { coordinator in
            coordinator.start()
        }
    }
    func openMenuViewController() {
        let menuViewController = MenuViewController()
        navigationController.present(menuViewController, animated: true, completion: nil)
    }

}
