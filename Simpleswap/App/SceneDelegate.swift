//
//  SceneDelegate.swift
//  Simpleswap

//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = makeNavigationController()
    }

    private func makeNavigationController() -> UINavigationController {
        let tabBarView = TabBarViewController()
        let navigationController = UINavigationController(rootViewController: tabBarView)
        return navigationController
    }
}
