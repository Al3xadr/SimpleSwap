//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//
import UIKit
class MarketCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    func start() {
        let marketViewModel = MarketViewModel()
        let marketViewController = MarketViewController(viewModel: marketViewModel)
        marketViewController.coordinator = self
        let tabBarController = navigationController.viewControllers.first as? UITabBarController
        tabBarController?.viewControllers?[1] = marketViewController
    }
    func showCoinDetails(coin: HomeCoinModel) {
        let coinViewController = CoinViewController(coin: coin)
        navigationController.pushViewController(coinViewController, animated: true)
    }
}
