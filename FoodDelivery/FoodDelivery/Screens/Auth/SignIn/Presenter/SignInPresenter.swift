//
//  SignInPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class SignInPresenter: SignInModuleOutput {

    // MARK: - SignInModuleOutput

    // MARK: - Properties

    weak var view: SignInViewInput?
}

// MARK: - SignInModuleInput

extension SignInPresenter: SignInModuleInput {

}

// MARK: - SignInViewOutput

extension SignInPresenter: SignInViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
