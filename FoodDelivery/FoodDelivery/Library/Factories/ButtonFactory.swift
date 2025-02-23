//
//  ButtonFactory.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import UIKit

enum ButtonFactory {

    enum ButtonType {
        case basic, onboarding, accent, secondary

        var config: UIButton.Configuration {
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = FontFamily.Roboto.bold.font(size: 18)
                return outgoing
            }
            switch self {
            case .basic:
                config.baseBackgroundColor = .App.white
                config.baseForegroundColor = .App.accentOrange
            case .onboarding:
                config.baseBackgroundColor = .App.white
                config.baseForegroundColor = .App.black
            case .accent:
                config.baseBackgroundColor = .App.white
                config.baseForegroundColor = .App.black
            case .secondary:
                config.baseBackgroundColor = .App.white
                config.baseForegroundColor = .App.secondaryFill
            }
            return config
        }
    }

    static func createButton(type: ButtonType, title: String = "") -> UIButton {
        let button = UIButton()
        button.configuration = type.config
        button.titleLabel?.text = title
        return button
    }

}
