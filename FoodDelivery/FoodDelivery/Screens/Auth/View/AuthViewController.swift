//
//  AuthViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {

    // MARK: - Properties

    private var authView = AuthView()

    var output: AuthViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = authView
    }
}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {

    func setupInitialState() {

    }

}
