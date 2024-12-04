//
//  OnboardingCollectionView.swift
//  FoodDelivery
//
//  Created by Игорь Пустыльник on 03.12.2024.
//

import UIKit

final class OnboardingAdapter: NSObject {

    // MARK: - Properties

    weak var delegate: OnboardingViewDelegate?

    private let collectionView: UICollectionView
    private var model: [OnboardingPageModel]?

    // MARK: - Initialization

    init(with collectionView: UICollectionView) {
        collectionView.register(OnboardingCollectionViewCell.self,
                                forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        self.collectionView = collectionView
    }

    // MARK: - Internal methods

    func configure(with model: [OnboardingPageModel]?) {
        self.model = model
        collectionView.reloadData()
    }

}

// MARK: - Scrollable

extension OnboardingAdapter: Scrollable {

    func scrollTo(itemAt index: Int) {
        guard let model else {
            return
        }
        guard index < model.count else {
            return
        }
        collectionView.isPagingEnabled = false
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }

}

// MARK: - UICollectionViewDataSource

extension OnboardingAdapter: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.identifier,
            for: indexPath
        ) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }

        if let model = model, !model.isEmpty {
            cell.configure(with: model[indexPath.row])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingAdapter: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        guard width > 0 else {
            return
        }
        delegate?.set(progress: offSet / width)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        delegate?.set(page: page)
    }

}
