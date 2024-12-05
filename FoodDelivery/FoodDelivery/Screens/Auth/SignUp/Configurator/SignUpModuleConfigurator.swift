//
//  SignUpModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignUpModuleConfigurator {

    func configure() -> (
       SignUpViewController,
       SignUpModuleOutput) {
        let view = SignUpViewController()
        let presenter = SignUpPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
