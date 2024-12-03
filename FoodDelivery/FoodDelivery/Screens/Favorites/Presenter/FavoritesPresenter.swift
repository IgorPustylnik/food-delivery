//
//  FavoritesPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 03/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class FavoritesPresenter: FavoritesModuleOutput {

    // MARK: - FavoritesModuleOutput

    // MARK: - Properties

    weak var view: FavoritesViewInput?
}

// MARK: - FavoritesModuleInput

extension FavoritesPresenter: FavoritesModuleInput {

}

// MARK: - FavoritesViewOutput

extension FavoritesPresenter: FavoritesViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
