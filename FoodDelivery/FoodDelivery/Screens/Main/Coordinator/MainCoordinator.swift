//
//  MainCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {

    // MARK: - MainCoordinatorOutput

    var onLogout: (() -> Void)?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showTabBar()
    }

}

// MARK: - Private methods

private extension MainCoordinator {

    func showTabBar() {
        let (view, output) = MainModuleConfigurator().configure()

        output.selectHomeScreen = runHomeFlow
        output.selectOrderScreen = runOrderFlow
        output.selectFavoritesScreen = runFavoritesFlow
        output.selectProfileScreen = runProfileFlow

        router.setRootModule(view)
        runHomeFlow(isInitial: true)
    }

    func runHomeFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = HomeCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runOrderFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = OrderCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runFavoritesFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = FavoritesCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

    func runProfileFlow(isInitial: Bool) {
        guard isInitial else {
            return
        }
        let coordinator = ProfileCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }

}
