//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties

    private var mainView = MainView()

    var output: MainViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = mainView
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

    func setupInitialState() {

    }

}
