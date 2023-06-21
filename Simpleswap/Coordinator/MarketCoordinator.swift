//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//
import UIKit
final class MarketCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        print("MarketCoordinator")
    }
}
