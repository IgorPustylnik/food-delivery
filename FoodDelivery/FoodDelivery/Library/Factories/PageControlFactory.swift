//
//  PageControlFactory.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import UIKit
import CHIPageControl

enum PageControlFactory {

    static func createPageControl() -> CHIBasePageControl {
        let pageControl = CHIPageControlAleppo()
        pageControl.radius = 5
        pageControl.padding = 5
        pageControl.tintColor = .App.white
        return pageControl
    }
}
