//
//  OnboardingViewInput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

protocol OnboardingViewInput: AnyObject {
    func configure(with model: [OnboardingPageModel])
    func set(page index: Int, buttonTitle: String)
}
