//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit

final class HomeCoordinator: Coordinator, CoinViewControllerDelegate {
    var navigationController: UINavigationController?
    private let tabBarController: UITabBarController
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    func start() {
        print("HomeCoordinator")
    }
    func showCoinDetails(coin: CoinModel) {
        guard let selectedViewController = tabBarController.selectedViewController as? UINavigationController else {
            return
        }
        let coinViewController = CoinViewController(coin: coin)
        coinViewController.delegate = self
        coinViewController.modalPresentationStyle = .fullScreen
        selectedViewController.present(coinViewController, animated: true, completion: nil)
    }
    func coinViewControllerDidDismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
