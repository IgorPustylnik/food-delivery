//
//  OnboardingPresenterModel.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import Foundation

enum OnboardingPresenterModel {

    enum Page: CaseIterable {
        case page1, page2, page3, page4

        var model: OnboardingPageModel {
            switch self {
            case .page1:
                return OnboardingPageModel(
                    title: L10n.Onboarding.Page1.title,
                    description: L10n.Onboarding.Page1.description,
                    image: .Onboarding.page1,
                    buttonTitle: buttonTitle
                )
            case .page2:
                return OnboardingPageModel(
                    title: L10n.Onboarding.Page2.title,
                    description: L10n.Onboarding.Page2.description,
                    image: .Onboarding.page2,
                    buttonTitle: buttonTitle
                )
            case .page3:
                return OnboardingPageModel(
                    title: L10n.Onboarding.Page3.title,
                    description: L10n.Onboarding.Page3.description,
                    image: .Onboarding.page3,
                    buttonTitle: buttonTitle
                )
            case .page4:
                return OnboardingPageModel(
                    title: L10n.Onboarding.Page4.title,
                    description: L10n.Onboarding.Page4.description,
                    image: .Onboarding.page4,
                    buttonTitle: buttonTitle
                )
            }
        }

        private var buttonTitle: String {
            switch self {
            case .page4:
                return L10n.Onboarding.Button.last
            default:
                return L10n.Onboarding.Button.next
            }
        }
    }

}
