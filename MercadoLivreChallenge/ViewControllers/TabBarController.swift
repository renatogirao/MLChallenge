//
//  CustomTabBarController.swift
//  MercadoLivreChallenge
//
//  Created by Renato Savoia Girão on 26/10/24.
//

import UIKit

class TabBarController: CustomTabBarController {

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

        // Configuração dos tabBarItems
        let homeViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let favoritesViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let settingsViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let shoppingCartViewControllerTabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        // Atribuição de tags
        homeViewControllerTabBarItem.tag = 0
        favoritesViewControllerTabBarItem.tag = 1
        shoppingCartViewControllerTabBarItem.tag = 2
        settingsViewControllerTabBarItem.tag = 3
        
        homeViewController.tabBarItem = homeViewControllerTabBarItem
        favoritesViewController.tabBarItem = favoritesViewControllerTabBarItem
        shoppingCartViewController.tabBarItem = shoppingCartViewControllerTabBarItem
        settingsViewController.tabBarItem = settingsViewControllerTabBarItem
        
        self.tabBar.unselectedItemTintColor = UIColor(hex: "80848B")
        self.tabBar.selectedImageTintColor = UIColor(hex: "4D4E52")
        
        // Adicionando os viewControllers à TabBar
        let tabBarList = [homeViewController, favoritesViewController, shoppingCartViewController, settingsViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
