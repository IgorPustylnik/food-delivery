//
//  FavoritesCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 03/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class FavoritesCoordinator: BaseCoordinator, FavoritesCoordinatorOutput {

    // MARK: - FavoritesCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        let (view, _) = FavoritesModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}

// MARK: - Private methods

private extension FavoritesCoordinator {

}
