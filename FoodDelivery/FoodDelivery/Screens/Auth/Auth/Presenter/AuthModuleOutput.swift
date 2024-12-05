//
//  AuthModuleOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol AuthModuleOutput: AnyObject {

    var showSignInScreenClosure: (() -> Void)? { get set }
    var showSignUpScreenClosure: (() -> Void)? { get set }

}
