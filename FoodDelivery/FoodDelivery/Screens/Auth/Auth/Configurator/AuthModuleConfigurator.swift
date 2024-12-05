//
//  AuthModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class AuthModuleConfigurator {

    func configure() -> (
       AuthViewController,
       AuthModuleOutput) {
        let view = AuthViewController()
        let presenter = AuthPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
