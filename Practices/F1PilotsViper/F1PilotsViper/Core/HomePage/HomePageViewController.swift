//
//  HomePageViewController.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func update(with pilots: [PilotResult])
}

class HomePageViewController: UIViewController, AnyView {

    var presenter: AnyPresenter?

    var pilotsList: [PilotResult]?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PilotsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "PilotsTableViewCell")
    }

    func update(with pilots: [PilotResult]) {
        DispatchQueue.main.async {
            self.pilotsList = pilots
            self.tableView.reloadData()
        }
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pilotsList?.count ?? 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:"PilotsTableViewCell") as? PilotsTableViewCell else { return UITableViewCell() }

        guard let model = pilotsList?[indexPath.row] else { return UITableViewCell() }

        cell.cellConfigure(name: model.name,
                           point: model.point)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

