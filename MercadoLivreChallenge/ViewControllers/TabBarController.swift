////
////  TabBarController.swift
////  MercadoLivreChallenge
////
////  Created by Renato Savoia Girão on 22/10/24.
////

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.backgroundColor = .black
        
        let homeViewController = HomeViewController()
        let favoritesViewController = FavoritesViewController()
        let settingsViewController = SettingsViewController()
        let shoppingCartViewController = ShoppingCartViewController()

        let homeViewControllerTabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let favoritesViewControllerTabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let settingsViewControllerTabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let shoppingCartViewControllerTabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        homeViewControllerTabBarItem.tag = 0
        favoritesViewControllerTabBarItem.tag = 1
        shoppingCartViewControllerTabBarItem.tag = 2
        settingsViewControllerTabBarItem.tag = 3
        
        homeViewController.tabBarItem = homeViewControllerTabBarItem
        favoritesViewController.tabBarItem = favoritesViewControllerTabBarItem
        shoppingCartViewController.tabBarItem = shoppingCartViewControllerTabBarItem
        settingsViewController.tabBarItem = settingsViewControllerTabBarItem
        
        self.tabBar.unselectedItemTintColor = .darkGray
        self.tabBar.selectedImageTintColor = .lightGray
        
        let tabBarList = [homeViewController, favoritesViewController, settingsViewController, shoppingCartViewController]

        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
