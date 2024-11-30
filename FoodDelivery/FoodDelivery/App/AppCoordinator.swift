//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 30.11.2024.
//

import Foundation

enum UserState {
    case notAuthorized
    case loggedIn
}

private enum LaunchInstructor {
    case auth
    case main

    static func configure(userState: UserState) -> LaunchInstructor {
        switch userState {
        case .notAuthorized:
            return .auth
        case .loggedIn:
            return .main
        }
    }

}

final class AppCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private var instructor: LaunchInstructor {
        // TODO: - get user state
        return .configure(userState: .notAuthorized)
    }

    // MARK: - Coordinator

    override func start() {
        switch instructor {
        case .auth:
            runAuthFlow()
        case .main:
            runMainFlow()
        }
    }

}

// MARK: - Private Methods

private extension AppCoordinator {

    func runAuthFlow() {
    }

    func runMainFlow() {
    }

}
