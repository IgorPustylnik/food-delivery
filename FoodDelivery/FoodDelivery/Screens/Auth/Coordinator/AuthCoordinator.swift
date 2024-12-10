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
        showMainModule()
    }

}

// MARK: - Private methods

private extension AuthCoordinator {

    func showMainModule() {
        let (view, output) = AuthModuleConfigurator().configure()
        output.showSignInScreenClosure = showSignInModule
        output.showSignUpScreenClosure = showSignUpModule
        let navigationController = UINavigationController(rootViewController: view)
        router.setRootModule(navigationController)
    }

    func showSignInModule() {
        let (view, output) = SignInModuleConfigurator().configure()
        output.forgotPasswordClosure = showForgotPasswordModule
        output.successfulSignInClosure = finishFlow
        router.push(view)
    }

    func showSignUpModule() {
        let (view, output) = SignUpModuleConfigurator().configure()
        output.forgotPasswordClosure = showForgotPasswordModule
        output.successfulSignUpClosure = finishFlow
        router.push(view)
    }

    func showForgotPasswordModule() {
        let alert = UIAlertController(title: "Feature not implemented",
                                      message: "You can't do that yet",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default)

        alert.addAction(action)
        router.present(alert, animated: true) { }
    }

}
