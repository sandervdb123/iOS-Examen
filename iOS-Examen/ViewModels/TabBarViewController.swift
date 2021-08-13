//
//  TabBarViewController.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    let vc1 = MoviesListVC()
    let vc2 = MoviesListVC()
        
        
        vc1.title = "Movies"
        vc2.title = "tsting"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav1 = UINavigationController(rootViewController: vc1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2], animated: false)
        
    }
}
