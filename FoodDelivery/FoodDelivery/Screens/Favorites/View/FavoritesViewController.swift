//
//  FavoritesViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 03/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: - Properties

    private var favoritesView = FavoritesView()

    var output: FavoritesViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = favoritesView
    }
}

// MARK: - FavoritesViewInput

extension FavoritesViewController: FavoritesViewInput {

    func setupInitialState() {

    }

}
