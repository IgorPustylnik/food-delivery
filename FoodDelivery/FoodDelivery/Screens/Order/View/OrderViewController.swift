//
//  OrderViewController.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OrderViewController: UIViewController {

    // MARK: - Properties

    private var orderView = OrderView()

    var output: OrderViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func loadView() {
        view = orderView
    }
}

// MARK: - OrderViewInput

extension OrderViewController: OrderViewInput {

    func setupInitialState() {

    }

}
