//
//  SignInView.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 05/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class SignInView: UIView {

    // MARK: - ViewController interaction

    var signInButtonClosure: ((_ username: String, _ password: String) -> Void)?
    var forgotPasswordButtonClosure: (() -> Void)?
    var facebookButtonClosure: (() -> Void)?
    var googlePlusButtonClosure: (() -> Void)?

    // MARK: - UI Elements

    private lazy var formView: UIView = {
        $0.addSubview(signInLabel)
        $0.addSubview(usernameTextField)
        $0.addSubview(passwordTextField)
        $0.addSubview(signInButton)
        $0.addSubview(forgotPasswordButton)
        return $0
    }(UIView())

    private lazy var signInLabel: UILabel = {
        $0.font = FontFamily.Roboto.bold.font(size: 24)
        $0.text = L10n.Authpage.Label.signin
        return $0
    }(UILabel())

    private lazy var usernameTextField: FDTextFieldView = {
        $0.configure(placeholderText: L10n.Authpage.Textfield.Signin.Username.placeholder,
                     autoCorrectionType: .no,
                     mode: .username)
        $0.setValidator(.username)
        return $0
    }(FDTextFieldView())

    private lazy var passwordTextField: FDTextFieldView = {
        $0.configure(placeholderText: L10n.Authpage.Textfield.Signin.Password.placeholder,
                     autoCorrectionType: .no,
                     mode: .password)
        $0.setValidator(.notEmpty)
        return $0
    }(FDTextFieldView())

    private lazy var signInButton: UIButton = {
        $0.setTitle(L10n.Authpage.Button.signin, for: .normal)
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

        signInLabel.anchor(top: formView.topAnchor,
                           leading: formView.leadingAnchor)

        usernameTextField.anchor(top: signInLabel.bottomAnchor,
                                 leading: formView.leadingAnchor,
                                 trailing: formView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0))
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        passwordTextField.anchor(top: usernameTextField.bottomAnchor,
                                 leading: formView.leadingAnchor,
                                 trailing: formView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        signInButton.anchor(top: passwordTextField.bottomAnchor,
                            leading: formView.leadingAnchor,
                            trailing: formView.trailingAnchor,
                            padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        forgotPasswordButton.anchor(top: signInButton.bottomAnchor,
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
        passwordTextField.onShouldReturn = { [weak self] textField in
            self?.pressedSignInButton()
        }
    }

}

// MARK: - Input methods

extension SignInView {

    func setUsernameError(_ error: String) {
        usernameTextField.setCustomError(text: error)
    }

    func setPasswordError(_ error: String) {
        passwordTextField.setCustomError(text: error)
    }

}

// MARK: - Actions

private extension SignInView {

    func bindButtons() {
        bottomView.facebookButtonClosure = facebookButtonClosure
        bottomView.googlePlusButtonClosure = googlePlusButtonClosure
        signInButton.addTarget(self, action: #selector(pressedSignInButton), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(pressedForgotPasswordButton), for: .touchUpInside)
    }

    @objc
    func pressedSignInButton() {
        guard usernameTextField.isValid(), passwordTextField.isValid() else {
            return
        }
        signInButtonClosure?(usernameTextField.currentText(),
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
