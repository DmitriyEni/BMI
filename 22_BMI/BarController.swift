//
//  BarController.swift
//  22_BMI
//
//  Created by Dmitriy Eni on 22.04.2022.
//

import Foundation
import UIKit

class BarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let BMIVC = BMIViewController(nibName: String(describing: BMIViewController.self), bundle: nil)
        let ColloriesVC = ColloriesViewController(nibName: String(describing: ColloriesViewController.self), bundle: nil)
        let WeightVC = WeightViewController(nibName: String(describing: WeightViewController.self), bundle: nil)

        tabBar.tintColor = .white
        tabBar.barStyle = .black
        
        BMIVC.tabBarItem = UITabBarItem(title: "ИМТ", image: nil, tag: 0)
        ColloriesVC.tabBarItem = UITabBarItem(title: "Калории", image: nil, tag: 1)
        WeightVC.tabBarItem = UITabBarItem(title: "Вес", image: nil, tag: 2)
        
        self.viewControllers = [BMIVC, ColloriesVC, WeightVC]
    }
}
