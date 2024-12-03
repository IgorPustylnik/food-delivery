//
//  FavoritesModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 03/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class FavoritesModuleConfigurator {

    func configure() -> (
       FavoritesViewController,
       FavoritesModuleOutput) {
        let view = FavoritesViewController()
        let presenter = FavoritesPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
