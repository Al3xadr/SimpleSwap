//
//  TradeViewController.swift
//  Simpleswap
//
//

import UIKit

final class TradeViewController: UIViewController {
    //var coordinator: TradeCoordinator?
    private let swapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swap"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let firstSwapTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter the quantity"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 15
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let secondSwapTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter the quantity"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 15
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let swapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Swap", for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: Self.self)
        view.backgroundColor = .white
        
        tabBarItem.image = Asset.trade.image
        tabBarItem.title = Constants.trade
        
        setupView()
        setupContraints()
    }
}

private extension TradeViewController {
    func setupView() {
        view.addSubview(swapLabel)
        view.addSubview(firstSwapTextFiled)
        view.addSubview(secondSwapTextFiled)
        view.addSubview(swapButton)
    }
    func setupContraints() {
        NSLayoutConstraint.activate([
            swapLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swapLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            swapLabel.widthAnchor.constraint(equalToConstant: 100),
            swapLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            firstSwapTextFiled.topAnchor.constraint(equalTo: swapLabel.bottomAnchor, constant: 40),
            firstSwapTextFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstSwapTextFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            firstSwapTextFiled.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            secondSwapTextFiled.topAnchor.constraint(equalTo: firstSwapTextFiled.bottomAnchor, constant: 20),
            secondSwapTextFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            secondSwapTextFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            secondSwapTextFiled.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            swapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            swapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            swapButton.topAnchor.constraint(equalTo: secondSwapTextFiled.bottomAnchor, constant: 40),
            swapButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
