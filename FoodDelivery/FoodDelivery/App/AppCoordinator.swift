//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 30.11.2024.
//

import Foundation

enum UserState {
    case notPassedOnboarding
    case notAuthorized
    case loggedIn
}

private enum LaunchInstructor {
    case onboarding
    case auth
    case main

    static func configure(userState: UserState) -> LaunchInstructor {
        switch userState {
        case .notPassedOnboarding:
            return .onboarding
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
        // TODO: get user state
        return .configure(userState: .loggedIn)
    }

    // MARK: - Coordinator

    override func start() {
        switch instructor {
        case .onboarding:
            runOnboardingFlow()
        case .auth:
            runAuthFlow()
        case .main:
            runMainFlow()
        }
    }

}

// MARK: - Private Methods

private extension AppCoordinator {

    func runOnboardingFlow() {
        let router = MainRouter()
        let coordinator = OnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    func runAuthFlow() {
        let router = MainRouter()
        let coordinator = AuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    func runMainFlow() {
        let router = MainRouter()
        let coordinator = MainCoordinator(router: router)
        coordinator.onLogout = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

}
