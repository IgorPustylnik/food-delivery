//
//  HomePresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class HomePresenter: HomeModuleOutput {

    // MARK: - HomeModuleOutput

    // MARK: - Properties

    weak var view: HomeViewInput?
}

// MARK: - HomeModuleInput

extension HomePresenter: HomeModuleInput {

}

// MARK: - HomeViewOutput

extension HomePresenter: HomeViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
