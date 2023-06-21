//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit
final class FavoriteCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        print("FavoriteCoordinator")
    }
}
