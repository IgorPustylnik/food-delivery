//
//  OnboardingView.swift
//  FoodDelivery
//
//  Created by igorpustylnik on 02/12/2024.
//  Copyright © 2024 Igor Pustylnik. All rights reserved.
//

import UIKit

final class OnboardingView: UIView {

    // MARK: - Properties

    weak var delegate: OnboardingViewDelegate?

    // MARK: - UI Elements

    private lazy var pageControl = PageControlFactory.createPageControl()

    private var adapter: OnboardingAdapter?
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)

        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var button = ButtonFactory.createButton(type: .onboarding)

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        configureCollectionView()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - UI Setup

    private func setupUI() {
        [collectionView, button, pageControl].forEach { addSubview($0) }

        backgroundColor = .App.accentOrange

        pageControl.numberOfPages = 4
        pageControl.set(progress: 2, animated: true)

        pageControl.anchorCenter(centerX: centerXAnchor)
        pageControl.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -45).isActive = true

        button.anchor(leading: leadingAnchor,
                      bottom: pageControl.bottomAnchor,
                      trailing: trailingAnchor,
                      padding: UIEdgeInsets(top: 0, left: 30, bottom: 44, right: 30))
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        collectionView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: button.topAnchor,
                              trailing: trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        )
    }

}

// MARK: - Outer configuration

extension OnboardingView {

    func configure(with model: [OnboardingPageModel]) {
        adapter?.configure(with: model)
        adapter?.delegate = delegate
    }

    func set(page index: Int, buttonTitle: String) {
        pageControl.set(progress: index, animated: true)
        button.setTitle(buttonTitle, for: .normal)
        adapter?.scrollTo(itemAt: index)
    }

    func set(progress: CGFloat) {
        pageControl.progress = progress
    }

}

// MARK: - Private configuration

private extension OnboardingView {

    func configureCollectionView() {
        adapter = OnboardingAdapter(with: collectionView)
        collectionView.dataSource = adapter
        collectionView.delegate = adapter
    }

}

// MARK: - Selectors

private extension OnboardingView {

    @objc
    func nextPage() {
        delegate?.pressedNext()
    }

}
