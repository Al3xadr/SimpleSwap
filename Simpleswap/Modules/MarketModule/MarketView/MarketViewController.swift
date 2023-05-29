//
//  MarketViewController.swift
//  Simpleswap
//
//

import UIKit
import RxSwift
import RxCocoa

final class MarketViewController: UIViewController {

    private let viewModel: MarketViewModelProtocol
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let disposeBag = DisposeBag()
    private var shownCoins = [Coin]()

    init(viewModel: MarketViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(describing: Self.self)
        view.backgroundColor = .white

        tabBarItem.image = Asset.market.image
        tabBarItem.title = Constants.market

        viewModel.fetchData()
        setupSearchBar()
        setupTableView()
        createConstraints()
        setupSearch()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MarketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shownCoins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MarketViewCell.identifier,
            for: indexPath
        ) as? MarketViewCell else { return UITableViewCell() }
        cell.setupData(coin: shownCoins[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MarketViewHeader.identifier)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CoinViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SetupElements
private extension MarketViewController {
    func setupSearchBar() {
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.borderStyle = .roundedRect
        searchBar.placeholder = Constants.search
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
    }

    func setupSearch() {
        searchBar
            .rx
            .text
            .orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] query in
                guard let self else { return }
                if query.isEmpty {
                    self.shownCoins = self.viewModel.coins
                    self.tableView.reloadData()
                } else {
                    self.shownCoins = self.viewModel.coins.filter { $0.name.hasPrefix(query) }
                    self.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }

    func setupTableView() {
        tableView.register(MarketViewCell.self, forCellReuseIdentifier: MarketViewCell.identifier)
        tableView.register(MarketViewHeader.self, forHeaderFooterViewReuseIdentifier: MarketViewHeader.identifier)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }

    func createConstraints() {
        NSLayoutConstraint.activate([
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),

            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor)
        ])
    }
}
