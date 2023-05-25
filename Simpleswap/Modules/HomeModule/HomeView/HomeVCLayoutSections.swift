//
//  HomeVCLayoutSections.swift
//  Simpleswap
//
//  Created by apple on 08.05.2023.
//

import Foundation
import UIKit

extension HomeViewController {
 /*
// MARK: - Layout TopCoin
    private func createTopCoinSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize:
                .init(widthDimension: .fractionalWidth(0.9),
                      heightDimension: .absolute(70)),
                                                       subitems: [item])
        group.interItemSpacing = .flexible(20)
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpasing: 10,
                                          supplementaryItems: [createSupplementaryItems()])
        section.contentInsets = .init(top: 0, leading: 20, bottom: 10, trailing: -20)
        return section
    }
// MARK: - Layout TopCoin
    private func createFavoriteCoinSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
         .init(widthDimension: .fractionalWidth(0.45),
               heightDimension: .fractionalHeight(0.9)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
         .init(widthDimension: .fractionalWidth(1),
               heightDimension: .fractionalHeight(0.2)),
                                                subitems: [item])
        group.interItemSpacing = .flexible(20)
        let section = createLayoutSection(group: group,
                                   behavior: .none,
                                   interGroupSpasing: 5,
                                   supplementaryItems: [createSupplementaryItems()])
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    private func createSupplementaryItems() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .estimated(40)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: "HeaderSupplementaryView",
                                                                               for: indexPath) as? HeaderSupplementaryView
            else {
                return UICollectionReusableView()
            }
            //header.configureHeader(categoryName: sections.pageData[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }*/
}
