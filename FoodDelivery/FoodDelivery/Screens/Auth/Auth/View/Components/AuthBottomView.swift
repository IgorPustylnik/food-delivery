//
//  BottomView.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 05.12.2024.
//

import UIKit

final class AuthBottomView: UIView {

    // MARK: - Parent view interactions

    var facebookButtonClosure: (() -> Void)?
    var googlePlusButtonClosure: (() -> Void)?

    // MARK: - UI Elements

    private lazy var lineView: UIView = {
        $0.backgroundColor = .App.blueishGrey.withAlphaComponent(0.3)
        $0.layer.cornerRadius = 1
        return $0
    }(UIView())

    private lazy var connectionsLabel: UILabel = {
        $0.font = FontFamily.Roboto.regular.font(size: 14)
        $0.text = L10n.Authpage.Label.connections
        $0.textColor = .App.blueishGrey
        $0.textAlignment = .center
        return $0
    }(UILabel())

    private lazy var junkFoodImageView: UIImageView = {
        $0.image = .Auth.junkFood
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    private lazy var socialsHStackView: UIStackView = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 20
        $0.distribution = .equalSpacing

        $0.addArrangedSubview(facebookButton)
        $0.addArrangedSubview(googlePlusButton)
        return $0
    }(UIStackView())

    private lazy var facebookButton: UIButton = {
        $0.setBackgroundImage(.Social.facebook, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.anchorSize(size: CGSize(width: 40, height: 40))
        $0.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var googlePlusButton: UIButton = {
        $0.setBackgroundImage(.Social.googlePlus, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.anchorSize(size: CGSize(width: 40, height: 40))
        $0.addTarget(self, action: #selector(googlePlusButtonPressed), for: .touchUpInside)
        return $0
    }(UIButton())

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - UI Setup

    private func setupUI() {
        [lineView, connectionsLabel, junkFoodImageView, socialsHStackView].forEach {
            addSubview($0)
        }

        connectionsLabel.anchor(top: topAnchor,
                                trailing: trailingAnchor,
                                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30))

        lineView.anchorCenter(centerY: connectionsLabel.centerYAnchor)
        lineView.anchor(leading: leadingAnchor,
                        trailing: connectionsLabel.leadingAnchor,
                        padding: UIEdgeInsets(top: 0, left: -1, bottom: 0, right: 12))
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        junkFoodImageView.anchor(top: lineView.bottomAnchor,
                                 leading: leadingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: -75, bottom: 0, right: 0))
        junkFoodImageView.anchorSize(size: CGSize(width: 280, height: 150))

        socialsHStackView.anchor(top: connectionsLabel.bottomAnchor,
                                 trailing: connectionsLabel.trailingAnchor,
                                 padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))

    }

}

// MARK: - Selectors

private extension AuthBottomView {

    @objc
    func facebookButtonPressed() {
        facebookButtonClosure?()
    }

    @objc
    func googlePlusButtonPressed() {
        googlePlusButtonClosure?()
    }

}
