//
//  MainTab.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import UIKit

enum MainTab: Int, CaseIterable {

    case home, order, favorites, profile

    // MARK: - Properties

    var title: String {
        switch self {
        case .home:
            return L10n.TabBar.Home.title
        case .order:
            return L10n.TabBar.Order.title
        case .favorites:
            return L10n.TabBar.Favorites.title
        case .profile:
            return L10n.TabBar.Profile.title
        }
    }

    var image: UIImage {
        var image = UIImage()
        switch self {
        case .home:
            image = .Tabbar.home
        case .order:
            return .Tabbar.order
        case .favorites:
            return .Tabbar.favorites
        case .profile:
            return .Tabbar.profile
        }
        return image.withTintColor(.App.tabBarGrey, renderingMode: .alwaysOriginal)
    }

    var selectedImage: UIImage {
        return image.withTintColor(.App.accentOrange, renderingMode: .alwaysOriginal)
    }
}
