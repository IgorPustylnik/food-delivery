//
//  SignInViewOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol SignInViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()
    func signIn(_ username: String, _ password: String)
    func forgotPassword()
}
