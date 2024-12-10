//
//  SignInViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {

    // MARK: - Properties

    private var signinView = SignInView()

    var output: SignInViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        signinView.signInButtonClosure = output?.signIn
        signinView.forgotPasswordButtonClosure = output?.forgotPassword
    }

    override func loadView() {
        view = signinView
    }
}

// MARK: - SignInViewInput

extension SignInViewController: SignInViewInput {

    func setupInitialState() {

    }

    func setUsernameError(_ error: String) {
        signinView.setUsernameError(error)
    }

    func setPasswordError(_ error: String) {
        signinView.setPasswordError(error)
    }

}
