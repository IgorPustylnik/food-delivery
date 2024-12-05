//
//  SignUpPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class SignUpPresenter: SignUpModuleOutput {

    // MARK: - SignUpModuleOutput

    // MARK: - Properties

    weak var view: SignUpViewInput?
}

// MARK: - SignUpModuleInput

extension SignUpPresenter: SignUpModuleInput {

}

// MARK: - SignUpViewOutput

extension SignUpPresenter: SignUpViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
