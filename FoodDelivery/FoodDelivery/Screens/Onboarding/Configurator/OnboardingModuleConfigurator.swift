//
//  OnboardingModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OnboardingModuleConfigurator {

    func configure() -> (
       OnboardingViewController,
       OnboardingModuleOutput) {
        let view = OnboardingViewController()
        let presenter = OnboardingPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
