//
//  CoinViewController.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 04.05.2023.
//

import UIKit

final class CoinViewController: UIViewController {
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        label.frame = CGRect(x: 200, y: 200, width: 200, height: 100)
        label.text = "Name"
        view.addSubview(label)
    }

}
