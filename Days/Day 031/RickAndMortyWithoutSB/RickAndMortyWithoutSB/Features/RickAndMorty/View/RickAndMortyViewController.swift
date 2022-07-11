//
//  RickAndMortyViewController.swift
//  RickAndMortyWithoutSB
//
//  Created by ali on 9.07.2022.
//

import UIKit
import SnapKit

protocol RickAndMortyOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}

final class RickAndMortyViewController: UIViewController {

    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()

    private lazy var results: [Result] = []

    lazy var viewModel: IRickAndMortyViewModel = RickAndMortyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }

    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        drawDesign()
        makeTableView()
        makeLabel()
        makeIndicator()

    }

    private func drawDesign() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RickAndMortyTableViewCell.self, forCellReuseIdentifier: RickAndMortyTableViewCell.Identifier.custom.rawValue)
        tableView.rowHeight = self.view.frame.size.height * 0.2
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.text = "Rick And Morty"
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
        }
        indicator.startAnimating()
    }
}

extension RickAndMortyViewController: RickAndMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.startAnimating()
    }

    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
}

extension RickAndMortyViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickAndMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyTableViewCell.Identifier.custom.rawValue) as? RickAndMortyTableViewCell else {
            return UITableViewCell()

        }
        cell.saveModel(model: results[indexPath.row])
        return cell
    }

}

extension RickAndMortyViewController {

    private func makeTableView () {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    private func makeLabel() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    private func makeIndicator() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
