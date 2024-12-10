//
//  SignUpModuleOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol SignUpModuleOutput: AnyObject {
    var successfulSignUpClosure: (() -> Void)? { get set }
    var forgotPasswordClosure: (() -> Void)? { get set }
}
