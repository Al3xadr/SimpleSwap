//
//  CoinViewController.swift
//  Simpleswap
//
//

import UIKit
protocol CoinViewControllerDelegate: AnyObject {
    func coinViewControllerDidDismiss()
}

final class CoinViewController: UIViewController {
    var delegate: CoinViewControllerDelegate?
    var label = UILabel()
    private var name: String
    private var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    init(coin: CoinModel) {
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
        setupView()
        setupConstraints()
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
    @objc private func dismissButtonTapped() {
        delegate?.coinViewControllerDidDismiss()
    }
}

extension CoinViewController {
    func setupView() {
        view.addSubview(dismissButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
