//
//  TabbBarContainerViewController.swift
//  UIComponents
//
//  Created by Semih Emre ÜNLÜ on 9.01.2022.
//

import UIKit

class TabbBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    func configureTabBar() {
        self.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let firstViewControler = storyboard.instantiateViewController(withIdentifier: "DynamicTableViewController")
        firstViewControler.tabBarItem.title = "Dynamic"
        firstViewControler.tabBarItem.image = UIImage(systemName: "calendar")
        firstViewControler.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        firstViewControler.view.tag = 0

        let secondViewController = storyboard.instantiateViewController(withIdentifier: "CompostitionalCollectionViewController")
        secondViewController.tabBarItem.title = "Compositional"
        secondViewController.tabBarItem.image = UIImage(systemName: "terminal")
        secondViewController.view.tag = 1

        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "TableViewController")
        thirdViewController.tabBarItem.title = "TableView"
        thirdViewController.tabBarItem.image = UIImage(systemName: "note")
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "trash")
        thirdViewController.view.tag = 2

        let viewControllers = [firstViewControler, secondViewController, thirdViewController]
        self.setViewControllers(viewControllers, animated: true)
    }
}

extension TabbBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "CompostitionalCollectionViewController")
        self.present(secondViewController, animated: true, completion: nil)
        return viewController.view.tag != 1
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(tabBarController.selectedIndex) //log
    }
}
