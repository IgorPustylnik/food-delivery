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
        let (view, _) = SignInModuleConfigurator().configure()
        router.push(view)
    }

    func showSignUpScreen() {
        let (view, _) = SignUpModuleConfigurator().configure()
        router.push(view)
    }

}
