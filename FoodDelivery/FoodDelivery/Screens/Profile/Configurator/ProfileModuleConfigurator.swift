//
//  ProfileModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class ProfileModuleConfigurator {

    func configure() -> (
       ProfileViewController,
       ProfileModuleOutput) {
        let view = ProfileViewController()
        let presenter = ProfilePresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
