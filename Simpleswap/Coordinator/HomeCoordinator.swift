//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit
class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    func start() {
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewController.coordinator = self
        let tabBarController = navigationController.viewControllers.first as? UITabBarController
        tabBarController?.viewControllers?[0] = homeViewController
    }
    func showCoinDetails(coin: HomeCoinModel) {
        let coinViewController = CoinViewController(coin: coin)
        navigationController.pushViewController(coinViewController, animated: true)
    }
}
