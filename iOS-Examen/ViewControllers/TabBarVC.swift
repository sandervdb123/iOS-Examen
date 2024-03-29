//
//  TabBarViewController.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let vc1 = MoviesListVC()
        let vc2 = SearchResUpdating()
        let vc3 = TopRatedMovies()
    
        
        
        vc1.title = "Popular Movies"
        vc3.title = "Top Rated Movies"
        vc2.title = "Search Movies"
        
        
        
        vc1.navigationItem.largeTitleDisplayMode = .never
        vc3.navigationItem.largeTitleDisplayMode = .never
        vc2.navigationItem.largeTitleDisplayMode = .never
        
        
        
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav1 = UINavigationController(rootViewController: vc1)
        
        nav1.navigationBar.prefersLargeTitles = false
        nav3.navigationBar.prefersLargeTitles = false
        nav2.navigationBar.prefersLargeTitles = false
        
        nav1.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label

        nav1.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "house"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Top Rated", image: UIImage(systemName: "star"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        
        setViewControllers([nav1,nav3,nav2], animated: false)
        
    }
}
