//
//  AuthView.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class AuthView: UIView {

    // MARK: - UI Elements

    private lazy var imageContainerView: UIView = {
        $0.backgroundColor = .App.accentOrange.withAlphaComponent(0.5)
        $0.layer.cornerRadius = 30
        $0.addSubview(burgerImageView)
        return $0
    }(UIView())

    private lazy var burgerImageView: UIImageView = {
        $0.image = .LaunchScreen.burger
        $0.contentMode = .scaleAspectFill
        $0.anchorSize(size: CGSize(width: 194, height: 148))
        return $0
    }(UIImageView())

    private lazy var signInButton: UIButton = {
        $0.setTitle(L10n.Authpage.Button.signin, for: .normal)
        return $0
    }(ButtonFactory.createButton(type: .accent))

    private lazy var signUpButton: UIButton = {
        $0.setTitle(L10n.Authpage.Button.signup, for: .normal)
        return $0
    }(ButtonFactory.createButton(type: .secondary))

    private lazy var bottomView = AuthBottomView()

    // MARK: Init

    init() {
        super.init(frame: .zero)
        bindButtons()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        bindButtons()
        setupUI()
    }

    // MARK: - UI Setup

    private func setupUI() {
        backgroundColor = .App.background

        [imageContainerView, signInButton, signUpButton, bottomView].forEach { addSubview($0) }

        burgerImageView.anchorCenter(to: imageContainerView)

        imageContainerView.anchor(top: safeAreaLayoutGuide.topAnchor,
                                  leading: leadingAnchor,
                                  trailing: trailingAnchor,
                                  padding: UIEdgeInsets(top: 60, left: 60, bottom: 0, right: 60))
        imageContainerView.heightAnchor.constraint(equalTo: imageContainerView.widthAnchor).isActive = true

        signInButton.anchor(top: imageContainerView.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            padding: UIEdgeInsets(top: 60, left: 30, bottom: 0, right: 30))
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        signUpButton.anchor(top: signInButton.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30))
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        bottomView.anchor(top: bottomAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: -151, left: 0, bottom: 0, right: 0)
        )
    }

}

// MARK: - Buttons pressed

private extension AuthView {

    func bindButtons() {
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        bottomView.facebookButtonClosure = facebookButtonPressed
        bottomView.googlePlusButtonClosure = googlePlusButtonPressed
    }

    @objc
    func signInButtonPressed() {

    }

    @objc
    func signUpButtonPressed() {

    }

    @objc
    func facebookButtonPressed() {
        print("facebook")
    }

    @objc
    func googlePlusButtonPressed() {
        print("googleplus")
    }

}
