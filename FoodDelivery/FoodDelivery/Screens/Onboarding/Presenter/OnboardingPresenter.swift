//
//  OnboardingPresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class OnboardingPresenter: OnboardingModuleOutput {

    // MARK: - OnboardingModuleOutput

    var onComplete: (() -> Void)?

    // MARK: - Properties

    weak var view: OnboardingViewInput?

    private lazy var model: [OnboardingPageModel] = {
        OnboardingPresenterModel.Page.allCases.map { $0.model }
    }()

    private var currentPage: Int? {
        didSet {
            guard let currentPage else {
                return
            }
            if currentPage == model.count {
                onComplete?()
                return
            }
            view?.set(page: currentPage, buttonTitle: model[currentPage].buttonTitle)
        }
    }
}

// MARK: - OnboardingModuleInput

extension OnboardingPresenter: OnboardingModuleInput {

}

// MARK: - OnboardingViewOutput

extension OnboardingPresenter: OnboardingViewOutput {

    func viewLoaded() {
        view?.configure(with: model)
        currentPage = 0
    }

    func nextPage() {
        guard let currentPage = self.currentPage else {
            return
        }
        if currentPage < model.count {
            self.currentPage = currentPage + 1
        }
    }

    func set(page index: Int) {
        currentPage = index
    }

}
