//
//  OnboardingCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {

    // MARK: - OnboardingCoordinatorOutput

    var onComplete: (() -> Void)?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        let (view, output) = OnboardingModuleConfigurator().configure()
        output.onComplete = onComplete
        router.setRootModule(view)
    }

}

// MARK: - Private methods

private extension OnboardingCoordinator {

}
