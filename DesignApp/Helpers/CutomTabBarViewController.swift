//
//  CutomTabBarViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 24/09/2022.
//

import UIKit

class CutomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor  = UIColor(named: "TabBarTint")!
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        self.additionalSafeAreaInsets.bottom = 20
    }


}
