//
//  SignInModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignInModuleConfigurator {

    func configure() -> (
       SignInViewController,
       SignInModuleOutput) {
        let view = SignInViewController()
        let presenter = SignInPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
