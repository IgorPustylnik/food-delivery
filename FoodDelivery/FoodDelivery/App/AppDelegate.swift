//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 30.11.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureServiceLocator()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}

// MARK: Private methods

private extension AppDelegate {

    func configureServiceLocator() {
        ServiceLocator.shared.register(service: UserDefaultsServiceImpl() as UserDefaultsService)
    }

}
