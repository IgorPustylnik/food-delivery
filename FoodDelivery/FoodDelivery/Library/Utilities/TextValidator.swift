//
//  TextFieldValidator.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 05.12.2024.
//

import Foundation

typealias ValidationResult = (isValid: Bool, errorMessage: String?)

enum TextValidator {

    case username
    case email
    case password

    func validate(_ text: String?) -> ValidationResult {
        guard let text else {
            return (false, "Empty")
        }
        switch self {
        case .username:
            guard text.count > 2 else {
                return (false, L10n.InvalidInput.Username.short)
            }
            guard text.count < 50 else {
                return (false, L10n.InvalidInput.Username.long)
            }
            return (true, nil)
        case .email:
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            guard NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text) else {
                return (false, L10n.InvalidInput.email)
            }
            return (true, nil)
        case .password:
            guard text.count > 8 else {
                return (false, L10n.InvalidInput.Password.long)
            }
            guard text.count < 50 else {
                return (false, L10n.InvalidInput.Password.long)
            }
            return (true, nil)
        }
    }
}
