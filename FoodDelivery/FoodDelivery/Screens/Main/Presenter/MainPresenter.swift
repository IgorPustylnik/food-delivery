//
//  MainPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class MainPresenter: MainModuleOutput {

    // MARK: - MainModuleOutput

    // MARK: - Properties

    weak var view: MainViewInput?
}

// MARK: - MainModuleInput

extension MainPresenter: MainModuleInput {

}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
