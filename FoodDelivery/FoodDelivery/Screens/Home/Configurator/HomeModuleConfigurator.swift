//
//  HomeModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class HomeModuleConfigurator {

    func configure() -> (
       HomeViewController,
       HomeModuleOutput) {
        let view = HomeViewController()
        let presenter = HomePresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
