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

    private var userDefaultsService: UserDefaultsService?

    private var instructor: LaunchInstructor {
        if let hasCompletedOnboarding = userDefaultsService?.hasCompletedOnboarding, hasCompletedOnboarding {
            return .configure(userState: .notAuthorized)
        }
        return .configure(userState: .notPassedOnboarding)
    }

    // MARK: - Init

    override init() {
        super.init()
        configureServices()
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
        coordinator.onComplete = { [weak self] in
            self?.userDefaultsService?.hasCompletedOnboarding = true
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

    func configureServices() {
        let userDefaultsService: UserDefaultsService? = ServiceLocator.shared.resolve()
        guard let userDefaultsService else {
            return
        }
        self.userDefaultsService = userDefaultsService
    }

}
