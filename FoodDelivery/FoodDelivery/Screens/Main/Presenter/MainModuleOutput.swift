//
//  MainModuleOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

typealias TabSelectClosure = (_ isInitial: Bool) -> Void

protocol MainModuleOutput: AnyObject {

    var selectHomeScreen: TabSelectClosure? { get set }
    var selectOrderScreen: TabSelectClosure? { get set }
    var selectFavoritesScreen: TabSelectClosure? { get set }
    var selectProfileScreen: TabSelectClosure? { get set }

}
