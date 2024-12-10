//
//  SignUpView.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignUpView: UIView {

    // MARK: - ViewController interaction

    var signUpButtonClosure: ((_ username: String, _ password: String) -> Void)?
    var forgotPasswordButtonClosure: (() -> Void)?
    var facebookButtonClosure: (() -> Void)?
    var googlePlusButtonClosure: (() -> Void)?

    // MARK: - UI Elements

    private lazy var formView: UIView = {
        $0.addSubview(signUpLabel)
        $0.addSubview(usernameTextField)
        $0.addSubview(passwordTextField)
        $0.addSubview(reenterPasswordTextField)
        $0.addSubview(signUpButton)
        $0.addSubview(forgotPasswordButton)
        return $0
    }(UIView())

    private lazy var signUpLabel: UILabel = {
        $0.font = FontFamily.Roboto.bold.font(size: 24)
        $0.text = L10n.Authpage.Label.signup
        return $0
    }(UILabel())

    private lazy var usernameTextField: FDTextFieldView = {
        $0.configure(placeholderText: L10n.Authpage.Textfield.Signup.Username.placeholder,
                     autoCorrectionType: .no,
                     mode: .username)
        $0.setValidator(.username)
        return $0
    }(FDTextFieldView())

    private lazy var passwordTextField: FDTextFieldView = {
        $0.configure(placeholderText: L10n.Authpage.Textfield.Signup.Password.placeholder,
                     autoCorrectionType: .no,
                     mode: .password)
        $0.setValidator(.password)
        return $0
    }(FDTextFieldView())

    private lazy var reenterPasswordTextField: FDTextFieldView = {
        $0.configure(placeholderText: L10n.Authpage.Textfield.Signup.Reenterpassword.placeholder,
                     autoCorrectionType: .no,
                     mode: .password)
        $0.setValidator(.notEmpty)
        return $0
    }(FDTextFieldView())

    private lazy var signUpButton: UIButton = {
        $0.setTitle(L10n.Authpage.Button.signup, for: .normal)
        return $0
    }(ButtonFactory.createButton(type: .accent))

    private lazy var forgotPasswordButton: UIButton = {
        $0.setTitle(L10n.Authpage.Button.forgot, for: .normal)
        return $0
    }(ButtonFactory.createButton(type: .noBackground))

    private lazy var bottomView = AuthBottomView()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        bindButtons()
        configureCloseKeyboardGesture()
        configureInputHandlers()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bindButtons()
        configureCloseKeyboardGesture()
        configureInputHandlers()
        setupUI()
    }

    // MARK: - UI Setup

    private func setupUI() {
        backgroundColor = .App.background

        [formView, bottomView].forEach { addSubview($0) }

        formView.anchorCenter(centerY: centerYAnchor)
        formView.anchor(leading: leadingAnchor,
                        trailing: trailingAnchor,
                        padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))

        signUpLabel.anchor(top: formView.topAnchor,
                           leading: formView.leadingAnchor)

        usernameTextField.anchor(top: signUpLabel.bottomAnchor,
                                 leading: formView.leadingAnchor,
                                 trailing: formView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0))
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        passwordTextField.anchor(top: usernameTextField.bottomAnchor,
                                 leading: formView.leadingAnchor,
                                 trailing: formView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        reenterPasswordTextField.anchor(top: passwordTextField.bottomAnchor,
                                 leading: formView.leadingAnchor,
                                 trailing: formView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        reenterPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        signUpButton.anchor(top: reenterPasswordTextField.bottomAnchor,
                            leading: formView.leadingAnchor,
                            trailing: formView.trailingAnchor,
                            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        forgotPasswordButton.anchor(top: signUpButton.bottomAnchor,
                                    bottom: formView.bottomAnchor,
                                    trailing: formView.trailingAnchor,
                                    padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 16).isActive = true

        let bottomOffset: CGFloat = UIScreen.main.bounds.height > 800 ? -151 : -121
        bottomView.anchor(top: bottomAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: bottomOffset, left: 0, bottom: 0, right: 0))
    }

    func configureCloseKeyboardGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        addGestureRecognizer(gestureRecognizer)
    }

    func configureInputHandlers() {
        usernameTextField.setNextResponder(passwordTextField.responder)
        passwordTextField.setNextResponder(reenterPasswordTextField.responder)
        reenterPasswordTextField.onShouldReturn = { [weak self] textField in
            self?.pressedSignUpButton()
        }
        passwordTextField.onEndEditing = { [weak self] textField in
            guard let password = self?.passwordTextField.currentText() else {
                return
            }
            self?.reenterPasswordTextField.setValidator(.match(password: password))
            _ = self?.reenterPasswordTextField.isValid()
        }
    }

}

// MARK: - Input methods

extension SignUpView {

    func setUsernameError(_ error: String) {
        usernameTextField.setCustomError(text: error)
    }

}

// MARK: - Actions

private extension SignUpView {

    func bindButtons() {
        bottomView.facebookButtonClosure = facebookButtonClosure
        bottomView.googlePlusButtonClosure = googlePlusButtonClosure
        signUpButton.addTarget(self, action: #selector(pressedSignUpButton), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(pressedForgotPasswordButton), for: .touchUpInside)
    }

    @objc
    func pressedSignUpButton() {
        guard usernameTextField.isValid(), passwordTextField.isValid() else {
            return
        }
        signUpButtonClosure?(usernameTextField.currentText(),
                             passwordTextField.currentText())
    }

    @objc
    func pressedForgotPasswordButton() {
        forgotPasswordButtonClosure?()
    }

    @objc
    func tapOnView() {
        endEditing(true)
    }

}
