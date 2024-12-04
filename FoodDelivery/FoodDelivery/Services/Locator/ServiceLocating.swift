//
//  ServiceLocating.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 04.12.2024.
//

protocol ServiceLocating {
    func resolve<T>() -> T?
}
