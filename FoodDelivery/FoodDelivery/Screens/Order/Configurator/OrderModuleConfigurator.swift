//
//  OrderModuleConfigurator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OrderModuleConfigurator {

    func configure() -> (
       OrderViewController,
       OrderModuleOutput) {
        let view = OrderViewController()
        let presenter = OrderPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
