//
//  OnboardingViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    // MARK: - Properties

    var output: OnboardingViewOutput?

    // MARK: - Private properties

    private var onboardingView: OnboardingView?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView = OnboardingView()
        onboardingView?.delegate = self
        view = onboardingView
        loadViewIfNeeded()
        output?.viewLoaded()
    }
}

// MARK: - OnboardingViewInput

extension OnboardingViewController: OnboardingViewInput {

    func configure(with model: [OnboardingPageModel]) {
        onboardingView?.configure(with: OnboardingPresenterModel.Page.allCases.map { $0.model })
    }

    func set(page index: Int, buttonTitle: String) {
        onboardingView?.set(page: index, buttonTitle: buttonTitle)
    }

}

// MARK: - OnboardingViewDelegate

extension OnboardingViewController: OnboardingViewDelegate {

    func pressedNext() {
        output?.nextPage()
    }

    func set(page index: Int) {
        output?.set(page: index)
    }

    func set(progress: CGFloat) {
        onboardingView?.set(progress: progress)
    }

}
