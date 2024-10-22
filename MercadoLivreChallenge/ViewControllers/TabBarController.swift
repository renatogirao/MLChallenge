////
////  TabBarController.swift
////  MercadoLivreChallenge
////
////  Created by Renato Savoia Girão on 22/10/24.
////
//
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        let favoritesViewController = FavoritesViewController()
        let settingsViewController = SettingsViewController()

        let homeViewControllerTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let favoritesViewControllerTabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let settingsViewControllerTabBarItem = UITabBarItem(title: "Configurações", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        
        homeViewControllerTabBarItem.tag = 0
        favoritesViewControllerTabBarItem.tag = 1
        settingsViewControllerTabBarItem.tag = 2
        
        homeViewController.tabBarItem = homeViewControllerTabBarItem
        favoritesViewController.tabBarItem = favoritesViewControllerTabBarItem
        settingsViewController.tabBarItem = settingsViewControllerTabBarItem
        let tabBarList = [homeViewController, favoritesViewController, settingsViewController]

        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
