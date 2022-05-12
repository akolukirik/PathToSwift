//
//  ViewController.swift
//  Earthquake
//
//  Created by ali on 12.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var earthquakeList: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DetailsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "DetailsTableViewCell")
        getData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
            cell.earthquakes = self.earthquakeList[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController {
    func getData() {
        let url = "https://apis.is/earthquake/is"

        AF.request(url, method: .get).responseDecodable(of: Earthquake.self) { [weak self] response in
                if let models = response.value {
                    self?.earthquakeList = models.results ?? []
                    self?.tableView.reloadData()
                }
            }
    }
}

