//
//  MaTabBar.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class MaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
        
        //changer le background color de ma tabbar
        //tabBar.barTintColor = .yellow
        
        //tabbar transparente
        //tabBar.barTintColor = .clear
        //tabBar.backgroundImage = UIImage()

    }
}
