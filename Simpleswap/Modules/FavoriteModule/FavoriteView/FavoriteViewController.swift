//
//  FavoriteViewController.swift
//  Simpleswap
//
//  Created by apple on 29.05.2023.
//

import Foundation
import UIKit
final class FavoriteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: Self.self)
        view.backgroundColor = .white
        tabBarItem.image = Asset.favorite.image
        tabBarItem.title = Constants.favorite
    }
}
