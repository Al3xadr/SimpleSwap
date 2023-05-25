//
//  HomeViewController.swift
//  Simpleswap
//
//  Created by Podgainy Sergei on 20.04.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModelProtocol
    private var coins = [HomeCoinModel]()
    fileprivate typealias DataSource = UICollectionViewDiffableDataSource<SectionModelCoin, HomeCoinModel>
    fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<SectionModelCoin, HomeCoinModel>
    private lazy var dataSource = makeDataSource()
    private let section = SectionModelCoin.allCases
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    // MARK: - CollectionView
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeBestCoinCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(HomeTopCoinCell.self, forCellWithReuseIdentifier: "CellTop")
        collectionView.register(HomeFavoriteCell.self, forCellWithReuseIdentifier: "CellFavorite")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        return collectionView
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(describing: Self.self)
        view.backgroundColor = .white
        tabBarItem.image = Asset.home.image
        tabBarItem.title = Constants.home
        collectionView.dataSource = self.dataSource
        setupView()
        setupContraints()
        viewModel.fetchData { [weak self] in
            self?.coins = self?.viewModel.coins ?? []
            self?.update()
        }
    }
}
// MARK: - Extension HomeViewController setupView and setupCollectionView
extension HomeViewController {
    private func setupView() {
        collectionView.collectionViewLayout = makeCollectionViewLayout()
        view.addSubview(collectionView)
    }
}

extension HomeViewController {
    private func setupContraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension HomeViewController {
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout {
            [weak self] sectionIndex, _ in
            switch self?.section[sectionIndex] {
            case .bestCoin:
                return self?.createBestCoinSection()
            case .topCoin:
                return self?.createTopCoinSection()
            case .topTwentyCoin:
                return self?.createFavoriteCoinSection()
            case nil:
                return nil
            }
        }
    }
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpasing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpasing
        section.boundarySupplementaryItems = supplementaryItems
        return section
    }
    // MARK: - Layout BestCoin
    private func createBestCoinSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
                .init(widthDimension: .fractionalWidth(1),
                      heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                .init(widthDimension: .fractionalWidth(0.9),
                      heightDimension: .fractionalHeight(0.30)),
                                                       subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpasing: 5,
                                          supplementaryItems: [])
        section.contentInsets = .init(top: 5, leading: 20, bottom: 10, trailing: -20)
        return section
    }
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
}

extension HomeViewController {
    fileprivate func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { (collectionView, indexPath, homeCoinModel) -> UICollectionViewCell? in
            switch self.section[indexPath.section] {
            case .bestCoin:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeBestCoinCell
                cell?.setupData(with: homeCoinModel)
                return cell
            case .topCoin:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTop", for: indexPath) as? HomeTopCoinCell
                cell?.setupData(with: homeCoinModel)
                return cell
            case .topTwentyCoin:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellFavorite", for: indexPath) as? HomeFavoriteCell
                cell?.setupData(with: homeCoinModel)
                return cell
            }
        }
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let sectionKind = SectionModelCoin(rawValue: indexPath.section) else { return nil }
            switch sectionKind {
            case .topCoin:
                let cell =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? HeaderSupplementaryView
                cell?.configureHeader(categoryName: "Top 4 Coin")
                return cell
            case .topTwentyCoin:
                let cell =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? HeaderSupplementaryView
                cell?.configureHeader(categoryName: "Top 20 Coin")
                return cell
            default:
                return nil
            }
        }
        return dataSource
    }    
    func update(animatingDifferences: Bool = true) {
        var snapshot = DataSourceSnapshot()
        let bestCoinSnapshotSection: [HomeCoinModel] =  coins.take(firstElement: 0, elementsCount: 1)
        let TopCoinSnapshotSection: [HomeCoinModel] =  coins.take(firstElement: 1, elementsCount: 5)
        let FavoritreCoin: [HomeCoinModel] = coins.take(firstElement: 5, elementsCount: 25)
        snapshot.appendSections([.bestCoin, .topCoin, .topTwentyCoin])
        snapshot.appendItems(bestCoinSnapshotSection, toSection: .bestCoin)
        snapshot.appendItems(TopCoinSnapshotSection, toSection: .topCoin)
        snapshot.appendItems(FavoritreCoin, toSection: .topTwentyCoin)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
