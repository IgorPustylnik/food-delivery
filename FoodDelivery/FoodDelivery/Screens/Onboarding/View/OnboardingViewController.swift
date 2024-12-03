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

    private var onboardingView = OnboardingView()

    var output: OnboardingViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = onboardingView
    }
}

// MARK: - OnboardingViewInput

extension OnboardingViewController: OnboardingViewInput {

    func setupInitialState() {

    }

}
