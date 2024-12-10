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
    case notEmpty
    case match(password: String)

    func validate(_ text: String?) -> ValidationResult {
        guard let text else {
            return (false, "Validation failed")
        }

        switch self {
        case .username:
            return validateUsername(text)
        case .email:
            return validateEmail(text)
        case .password:
            return validatePassword(text)
        case .notEmpty:
            return validateRequired(text)
        case .match(let password):
            return validateMatchPassword(text, password: password)
        }
    }

    private func validateUsername(_ text: String) -> ValidationResult {
        if text.count < 2 {
            return (false, L10n.InvalidInput.Username.short)
        }
        if text.count > 50 {
            return (false, L10n.InvalidInput.Username.long)
        }
        return (true, nil)
    }

    private func validateEmail(_ text: String) -> ValidationResult {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if !NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text) {
            return (false, L10n.InvalidInput.email)
        }
        return (true, nil)
    }

    private func validatePassword(_ text: String) -> ValidationResult {
        if text.count < 8 {
            return (false, L10n.InvalidInput.Password.short)
        }
        if text.count > 50 {
            return (false, L10n.InvalidInput.Password.long)
        }
        return (true, nil)
    }

    private func validateRequired(_ text: String) -> ValidationResult {
        if text.isEmpty {
            return (false, L10n.InvalidInput.Required.empty)
        }
        return (true, nil)
    }

    private func validateMatchPassword(_ text: String, password: String) -> ValidationResult {
        if text != password {
            return (false, L10n.InvalidInput.Password.mismatch)
        }
        return (true, nil)
    }
}
