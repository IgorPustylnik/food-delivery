//
//  UIApplication+ext.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 01.12.2024.
//

import UIKit

extension UIApplication {

    class func topViewController(_ controller: UIViewController? = {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first(where: { $0.isKeyWindow })?.rootViewController
    }()) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        return controller
    }

}
