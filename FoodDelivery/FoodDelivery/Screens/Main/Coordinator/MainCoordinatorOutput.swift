//
//  MainCoordinatorOutput.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

protocol MainCoordinatorOutput: AnyObject {
    var onLogout: (() -> Void)? { get set }
}
