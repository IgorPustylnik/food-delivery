//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class MainViewController: UITabBarController {

    // MARK: Constants

    private enum Constants {
        static let tabBarItemTitleFont = FontFamily.Roboto.regular.font(size: 12)
    }

    // MARK: - Properties

    var output: MainViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureAppearance()
        configureControllers()
    }

}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
}

// MARK: - UITabBarControllerDelegate

extension MainViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        guard let tab = MainTab(rawValue: viewController.tabBarItem.tag) else {
            return
        }
        let navigationController = viewController as? UINavigationController
        let isInitial = navigationController?.viewControllers.isEmpty ?? true
        output?.selectTab(tab, isInitial: isInitial)
    }

}

// MARK: Configuration

private extension MainViewController {

    func configureAppearance() {
        tabBar.barTintColor = .App.background
        tabBar.tintColor = .App.accentOrange
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .App.background
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

    func configureControllers() {
        var controllers: [UIViewController] = []
        for tab in MainTab.allCases {
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            tabBarItem.tag = tab.rawValue
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Constants.tabBarItemTitleFont],
                                              for: .normal)

            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabBarItem
            controllers.append(navigationController)
        }
        viewControllers = controllers
    }

}
