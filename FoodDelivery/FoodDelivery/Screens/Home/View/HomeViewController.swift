//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Properties

    private var homeView = HomeView()

    var output: HomeViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = homeView
    }
}

// MARK: - HomeViewInput

extension HomeViewController: HomeViewInput {

    func setupInitialState() {

    }

}
