//
//  OnboardingModuleOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol OnboardingModuleOutput: AnyObject {

    var onComplete: (() -> Void)? { get set }

}
