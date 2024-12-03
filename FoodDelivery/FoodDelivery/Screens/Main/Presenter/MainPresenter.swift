//
//  MainPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class MainPresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    var selectHomeScreen: TabSelectClosure?
    var selectOrderScreen: TabSelectClosure?
    var selectFavoritesScreen: TabSelectClosure?
    var selectProfileScreen: TabSelectClosure?

    // MARK: - Properties

    weak var view: MainViewInput?
}

// MARK: - MainModuleInput

extension MainPresenter: MainModuleInput {

}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {

    func selectTab(_ tab: MainTab, isInitial: Bool) {
        switch tab {
        case .home:
            selectHomeScreen?(isInitial)
        case .order:
            selectOrderScreen?(isInitial)
        case .favorites:
            selectFavoritesScreen?(isInitial)
        case .profile:
            selectProfileScreen?(isInitial)
        }
    }

}
