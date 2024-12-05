//
//  AuthPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class AuthPresenter: AuthModuleOutput {

    // MARK: - AuthModuleOutput

    var showSignInScreenClosure: (() -> Void)?
    var showSignUpScreenClosure: (() -> Void)?

    // MARK: - Properties

    weak var view: AuthViewInput?
}

// MARK: - AuthModuleInput

extension AuthPresenter: AuthModuleInput {

}

// MARK: - AuthViewOutput

extension AuthPresenter: AuthViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

    func showSignInScreen() {
        showSignInScreenClosure?()
    }

    func showSignUpScreen() {
        showSignUpScreenClosure?()
    }

}
