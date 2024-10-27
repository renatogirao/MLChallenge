//
//  CustomTabBarController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        self.tabBar.backgroundColor = UIColor(hex: "#0E1116")

        let homeViewController = HomeViewController()
        let favoritesViewController = FavoritesViewController()
        let settingsViewController = SettingsViewController()
        let shoppingCartViewController = ShoppingCartViewController()

        let homeViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let favoritesViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let settingsViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let shoppingCartViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))

        homeViewController.tabBarItem = homeViewControllerTabBarItem
        favoritesViewController.tabBarItem = favoritesViewControllerTabBarItem
        shoppingCartViewController.tabBarItem = shoppingCartViewControllerTabBarItem
        settingsViewController.tabBarItem = settingsViewControllerTabBarItem

        let tabBarList = [homeViewController, favoritesViewController, shoppingCartViewController, settingsViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = view.frame.size.height - tabFrame.size.height
        tabBar.frame = tabFrame
    }
}
