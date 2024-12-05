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
        let (view, _) = AuthModuleConfigurator().configure()
        router.setRootModule(view)
    }

}
