//
//  Presentable.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 01.12.2024.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
