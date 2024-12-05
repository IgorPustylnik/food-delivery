//
//  SignUpViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {

    // MARK: - Properties

    private var signupView = SignUpView()

    var output: SignUpViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = signupView
    }
}

// MARK: - SignUpViewInput

extension SignUpViewController: SignUpViewInput {

    func setupInitialState() {

    }

}
