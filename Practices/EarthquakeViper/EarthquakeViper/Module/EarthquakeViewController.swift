//
//  EarthquakeViewController.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import UIKit

// presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func update(with earthquakes: [EarthquakeResult])

}

class EarthquakeViewController: UIViewController, AnyView {

    var presenter: AnyPresenter?

    var earthquakeList: [EarthquakeResult]?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EarthquakeTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "EarthquakeTableViewCell")
        view.backgroundColor = .purple
    }

    func update(with earthquakes: [EarthquakeResult]) {
        DispatchQueue.main.async {
            self.earthquakeList = earthquakes
            self.tableView.reloadData()
        }
    }
    
}

extension EarthquakeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeList?.count ?? 2
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:"EarthquakeTableViewCell") as? EarthquakeTableViewCell else { return UITableViewCell() }

        guard let model = earthquakeList?[indexPath.row] else { return UITableViewCell() }


        cell.configure(test1: model.humanReadableLocation,
                       test2: model.humanReadableLocation)

        return cell
    }

}
