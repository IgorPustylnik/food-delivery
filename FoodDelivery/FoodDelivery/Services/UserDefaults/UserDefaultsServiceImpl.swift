//
//  UserDefaultsServiceImpl.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 04.12.2024.
//

import Foundation

final class UserDefaultsServiceImpl: UserDefaultsService {

    private var defaults = UserDefaults.standard

    var hasCompletedOnboarding: Bool {
        get {
            defaults.bool(forKey: "completedOnboarding")
        }
        set {
            defaults.setValue(newValue, forKey: "completedOnboarding")
        }
    }

}
