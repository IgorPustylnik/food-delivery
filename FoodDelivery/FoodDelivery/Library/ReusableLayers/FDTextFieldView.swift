//
//  FDTextFieldView.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 05.12.2024.
//

import UIKit

final class FDTextFieldView: UIView {

    enum Mode {
        case username, email, password

        var contentType: UITextContentType {
            switch self {
            case .username:
                return .username
            case .email:
                return .emailAddress
            case .password:
                return .password
            }
        }

        var keyboardType: UIKeyboardType {
            switch self {
            case .username:
                return .default
            case .email:
                return .emailAddress
            case .password:
                return .asciiCapable
            }
        }
    }

    // MARK: - Properties

    var onBeginEditing: ((UITextField) -> Void)?
    var onEndEditing: ((UITextField) -> Void)?
    var onShouldReturn: ((UITextField) -> Void)?
    var responder: UIResponder {
        return textField
    }

    // MARK: - Private properties

    private var validator: TextValidator?
    private var nextInput: UIResponder?
    private var isError = false

    // MARK: - UI Elements

    private lazy var textFieldContainer: UIView = {
        $0.backgroundColor = .App.secondaryFill
        $0.addSubview(textField)
        return $0
    }(UIView())

    private lazy var textField: UITextField = {
        $0.font = FontFamily.Roboto.regular.font(size: 14)
        $0.textColor = .App.black
        $0.tintColor = .App.black
        $0.autocapitalizationType = .none
        $0.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        $0.delegate = self
        return $0
    }(UITextField())

    private lazy var errorLabel: UILabel = {
        $0.alpha = 0
        $0.font = FontFamily.Roboto.regular.font(size: 12)
        $0.textColor = .App.red
        return $0
    }(UILabel())

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Setup UI

    private func setupUI() {
        [textFieldContainer, errorLabel].forEach { addSubview($0) }

        textField.anchor(top: textFieldContainer.topAnchor,
                  leading: textFieldContainer.leadingAnchor,
                  bottom: textFieldContainer.bottomAnchor,
                  trailing: textFieldContainer.trailingAnchor,
                  padding: UIEdgeInsets(top: 17, left: 30, bottom: 17, right: 30))

        textFieldContainer.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: nil,
                             trailing: trailingAnchor)
        textFieldContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true

        errorLabel.anchor(top: textFieldContainer.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 5, left: 30, bottom: 0, right: 0))
        errorLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textFieldContainer.layer.cornerRadius = textFieldContainer.frame.height / 2
    }

    // MARK: - Internal methods

    func configure(placeholderText: String?, autoCorrectionType: UITextAutocorrectionType, mode: FDTextFieldView.Mode) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholderText ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.App.black.withAlphaComponent(0.5),
                NSAttributedString.Key.font: FontFamily.Roboto.regular.font(size: 14)
            ]
        )
        textField.autocorrectionType = autoCorrectionType
        textField.keyboardType = mode.keyboardType
        textField.textContentType = mode.contentType
        textField.isSecureTextEntry = mode == .password
    }

    func setValidator(_ validator: TextValidator) {
        self.validator = validator
    }

    func setNextResponder(_ nextResponder: UIResponder) {
        textField.returnKeyType = .next
        nextInput = nextResponder
    }

    func isValid() -> Bool {
        validate()
        return !isError
    }

    func setCustomError(text: String?) {
        isError = true
        setError(text: text)
    }

    func currentText() -> String {
        return textField.text ?? ""
    }

}

// MARK: - Private mthods

private extension FDTextFieldView {

    func validate() {
        guard let validator = validator else {
            return
        }
        let validation = validator.validate(textField.text)
        isError = !validation.isValid
        setError(text: validation.errorMessage)
    }

    func setError(text: String?) {
        errorLabel.text = text
        UIView.animate(withDuration: 0.3) {
            self.errorLabel.alpha = self.isError ? 1 : 0
        }
    }

    @objc
    func textFieldEditingChanged() {
        isError = false
        setError(text: nil)
    }
}

// MARK: - UITextFieldDelegate

extension FDTextFieldView: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        onBeginEditing?(textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        validate()
        onEndEditing?(textField)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = nextInput {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            onShouldReturn?(textField)
            return true
        }
        return false
    }

}
