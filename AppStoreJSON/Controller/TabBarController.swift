//
//  BaseTabBarController.swift
//  AppStoreJSON
//
//  Created by Jason Yu on 8/23/19.
//  Copyright © 2019 Jason Yu. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let todayViewController = UIViewController()
//        todayViewController.view.backgroundColor = .white
//        todayViewController.navigationItem.title = "Today"
//
//        let todayNavController = UINavigationController(rootViewController: todayViewController)
//        todayNavController.tabBarItem.title = "Today"
//        todayNavController.navigationBar.prefersLargeTitles = true
//        todayNavController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        
        //viewControllers is a property that belongs to UITabBarController - defines the tabs
        viewControllers = [
            createNavController(viewController: UIViewController(), navTitle: "Today", imageTitle: "today_icon"),
            createNavController(viewController: UIViewController(), navTitle: "Apps", imageTitle: "apps"),
            createNavController(viewController: AppsSearchViewController(collectionViewLayout: UICollectionViewFlowLayout()), navTitle: "Search", imageTitle: "search")
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, navTitle: String, imageTitle: String) -> UIViewController {
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = navTitle
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = navTitle
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageTitle)
        
        return navController
    }
}
