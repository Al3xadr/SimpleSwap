//
//  CoinViewController.swift
//  Simpleswap
//
//

import UIKit

final class CoinViewController: UIViewController {
    var label = UILabel()
    //private var coinData: CoinModelProtocol
    private var name: String
    
    init(coin: HomeCoinModel) {
        //self.coinData = coinData
        self.name = coin.name
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        label.frame = CGRect(x: 200, y: 200, width: 200, height: 100)
        label.text = name
        view.addSubview(label)
    }

}
