//
//  OrderPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class OrderPresenter: OrderModuleOutput {

    // MARK: - OrderModuleOutput

    // MARK: - Properties

    weak var view: OrderViewInput?
}

// MARK: - OrderModuleInput

extension OrderPresenter: OrderModuleInput {

}

// MARK: - OrderViewOutput

extension OrderPresenter: OrderViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
