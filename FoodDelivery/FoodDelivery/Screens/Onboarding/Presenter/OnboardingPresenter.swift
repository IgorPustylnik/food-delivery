//
//  OnboardingPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class OnboardingPresenter: OnboardingModuleOutput {

    // MARK: - OnboardingModuleOutput

    // MARK: - Properties

    weak var view: OnboardingViewInput?
}

// MARK: - OnboardingModuleInput

extension OnboardingPresenter: OnboardingModuleInput {

}

// MARK: - OnboardingViewOutput

extension OnboardingPresenter: OnboardingViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
