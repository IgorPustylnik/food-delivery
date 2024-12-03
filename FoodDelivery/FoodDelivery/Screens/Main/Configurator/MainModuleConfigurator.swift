//
//  MainModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class MainModuleConfigurator {

    func configure() -> (
       MainViewController,
       MainModuleOutput) {
        let view = MainViewController()
        let presenter = MainPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
