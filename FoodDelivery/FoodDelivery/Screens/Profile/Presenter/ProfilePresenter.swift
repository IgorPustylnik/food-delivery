//
//  ProfilePresenter.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

final class ProfilePresenter: ProfileModuleOutput {

    // MARK: - ProfileModuleOutput

    // MARK: - Properties

    weak var view: ProfileViewInput?
}

// MARK: - ProfileModuleInput

extension ProfilePresenter: ProfileModuleInput {

}

// MARK: - ProfileViewOutput

extension ProfilePresenter: ProfileViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
