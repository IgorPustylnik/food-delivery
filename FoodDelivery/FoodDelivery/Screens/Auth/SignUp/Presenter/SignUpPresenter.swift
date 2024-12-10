//
//  SignUpPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class SignUpPresenter: SignUpModuleOutput {

    // MARK: - SignUpModuleOutput

    var successfulSignUpClosure: (() -> Void)?
    var forgotPasswordClosure: (() -> Void)?

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

    func signUp(_ username: String, _ password: String) {
        if username == "user" {
            successfulSignUpClosure?()
            return
        }
        view?.setUsernameError("This username is not allowed")
    }

    func forgotPassword() {
        forgotPasswordClosure?()
    }

}
