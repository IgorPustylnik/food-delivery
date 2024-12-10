//
//  SignInPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class SignInPresenter: SignInModuleOutput {

    // MARK: - SignInModuleOutput

    var successfulSignInClosure: (() -> Void)?
    var forgotPasswordClosure: (() -> Void)?

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

    func signIn(_ username: String, _ password: String) {
        if username == "admin" {
            successfulSignInClosure?()
            return
        }
        view?.setPasswordError("Wrong password")
    }

    func forgotPassword() {
        forgotPasswordClosure?()
    }

}
