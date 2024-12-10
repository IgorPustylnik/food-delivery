//
//  SignInViewInput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol SignInViewInput: AnyObject {
    /// Method for setup initial state of view
    func setupInitialState()
    func setUsernameError(_ error: String)
    func setPasswordError(_ error: String)
}
