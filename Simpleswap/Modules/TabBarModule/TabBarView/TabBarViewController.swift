//
//  TabBarViewController.swift
//  Simpleswap
//
//

import UIKit

final class TabBarViewController: UITabBarController {

    private let home = HomeViewController(viewModel: HomeViewModel())
    private let market = MarketViewController(viewModel: MarketViewModel())
    private let trade = TradeViewController()
    private let favorite = FavoriteViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SimpleSwap"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Asset.menu.name),
            style: .plain,
            target: self,
            action: #selector(leftBarButtonPressed)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
        setupViewControllers()
        configureUI()
    }

    @objc private func leftBarButtonPressed() {
        print("open settings")
    }

    @objc private func sortButton() {
        print("open sort")
    }

    private func setupViewControllers() {
        home.loadViewIfNeeded()
        market.loadViewIfNeeded()
        trade.loadViewIfNeeded()
        favorite.loadViewIfNeeded()

        let arrayVC = [home, market, favorite, trade]
        setViewControllers(arrayVC, animated: true)
    }

    private func configureUI() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(red: 0.057, green: 0.296, blue: 0.654, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.613, green: 0.613, blue: 0.613, alpha: 1)
        tabBar.isTranslucent = false
        let topline = CALayer()
        topline.frame = CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 0.5)
        topline.backgroundColor = UIColor.gray.cgColor
        self.tabBar.layer.addSublayer(topline)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.up.arrow.down"),
            style: .plain,
            target: self,
            action: #selector(sortButton)
        )
        rightBarButton.tintColor = .black

        switch item.title {
        case "Home": navigationItem.rightBarButtonItem = .none
        case "Market": navigationItem.rightBarButtonItem = rightBarButton
        case "Favorite": navigationItem.rightBarButtonItem = rightBarButton
        case "Trade": navigationItem.rightBarButtonItem = .none
        default: print("none")
        }
    }
}
