//
//  Coordinator.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 30.11.2024.
//

import Foundation

protocol Coordinator: AnyObject {
    /// Notifies coordinator that it can start itself
    func start()
    /// Notifies coordinator that is should remove all child coordinators
    func removeAllChildren()
}
