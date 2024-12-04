//
//  OnboardingCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnboardingCollectionViewCell"

    // MARK: - UI Elements

    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    private lazy var titleLabel: UILabel = {
        $0.font = FontFamily.Roboto.bold.font(size: 24)
        $0.textColor = .App.white
        $0.textAlignment = .center
        return $0
    }(UILabel())

    private lazy var descriptionLabel: UILabel = {
        $0.font = FontFamily.Roboto.regular.font(size: 14)
        $0.textColor = .App.white
        $0.textAlignment = .center
        return $0
    }(UILabel())

    // MARK: - Configuration

    func configure(with model: OnboardingPageModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        setupUI()
    }

    // MARK: - Setup UI

    private func setupUI() {
        [imageView, titleLabel, descriptionLabel].forEach { addSubview($0) }

        titleLabel.numberOfLines = 1
        descriptionLabel.numberOfLines = 2

        imageView.anchorCenter(centerX: centerXAnchor,
                               centerY: centerYAnchor)
        imageView.anchorSize(size: CGSize(width: 200, height: 200))

        titleLabel.anchorCenter(centerX: centerXAnchor)
        titleLabel.anchor(top: imageView.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 30))

        descriptionLabel.anchorCenter(centerX: centerXAnchor)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor,
                                leading: leadingAnchor,
                                trailing: trailingAnchor,
                                padding: UIEdgeInsets(top: 23, left: 30, bottom: 0, right: 30))
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
    }

}
