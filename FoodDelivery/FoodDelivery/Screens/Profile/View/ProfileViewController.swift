//
//  ProfileViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Properties

    private var profileView = ProfileView()

    var output: ProfileViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = profileView
    }
}

// MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {

    func setupInitialState() {

    }

}
