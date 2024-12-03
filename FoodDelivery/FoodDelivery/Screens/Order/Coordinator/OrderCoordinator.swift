//
//  OrderCoordinator.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OrderCoordinator: BaseCoordinator, OrderCoordinatorOutput {

    // MARK: - OrderCoordinatorOutput

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    override func start() {
        let (_, _) = OrderModuleConfigurator().configure()

    }

}

// MARK: - Private methods

private extension OrderCoordinator {

}
