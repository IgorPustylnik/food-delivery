//
//  HomeCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {

    // MARK: - HomeCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        let (view, _) = HomeModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}

// MARK: - Private methods

private extension HomeCoordinator {

}
