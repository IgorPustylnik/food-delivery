//
//  AuthCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    // MARK: - AuthCoordinatorOutput

    var finishFlow: (() -> Void)?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showMainScreen()
    }

}

// MARK: - Private methods

private extension AuthCoordinator {

    func showMainScreen() {
        let (view, output) = AuthModuleConfigurator().configure()
        output.showSignInScreenClosure = showSignInScreen
        output.showSignUpScreenClosure = showSignUpScreen
        let navigationController = UINavigationController(rootViewController: view)
        router.setRootModule(navigationController)
    }

    func showSignInScreen() {
        let (view, output) = SignInModuleConfigurator().configure()
        output.forgotPasswordClosure = showForgotPasswordScreen
        output.successfulSignInClosure = finishFlow
        router.push(view)
    }

    func showSignUpScreen() {
        let (view, output) = SignUpModuleConfigurator().configure()
        output.forgotPasswordClosure = showForgotPasswordScreen
        output.successfulSignUpClosure = finishFlow
        router.push(view)
    }

    func showForgotPasswordScreen() {
        let alert = UIAlertController(title: "Feature not implemented",
                                      message: "You can't do that yet",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default)

        alert.addAction(action)
        router.present(alert, animated: true) { }
    }

}
