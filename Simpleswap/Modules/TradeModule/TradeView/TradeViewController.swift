//
//  TradeViewController.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 27.04.2023.
//

import UIKit

final class TradeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(describing: Self.self)
        view.backgroundColor = .white

        tabBarItem.image = Asset.trade.image
        tabBarItem.title = Constants.trade
    }
}
