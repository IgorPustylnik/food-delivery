//
//  OnboardingViewDelegate.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import Foundation

/// This protocol is made to link View with ViewController for further interaction with Presenter
protocol OnboardingViewDelegate: AnyObject {
    func pressedNext()
    func set(page index: Int)
    func set(progress: CGFloat)
}
