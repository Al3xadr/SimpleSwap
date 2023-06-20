//
//  TabBarCoordinator.swift
//  Simpleswap
//
//  Created by apple on 19.06.2023.
//

import UIKit
class FavoriteCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    func start() {
        print("Favorite Coordinator start")
        // Set up and present your Favorite view controller here
    }
}
