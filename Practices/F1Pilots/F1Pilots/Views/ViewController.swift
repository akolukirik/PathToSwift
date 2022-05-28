//
//  ViewController.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var pilotsList: [PilotDetail] = []

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
        return pilotsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
            cell.pilots = self.pilotsList[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController {

    func getData() {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/drivers"

        AF.request(url, method: .get).responseDecodable(of: Drivers.self) { [weak self] response in
                if let models = response.value {
                    self?.pilotsList = models.items ?? []
                    self?.tableView.reloadData()
                }
            }
    }

    /*func getCountryRequest(countryCode: String) {
        let url = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)"
        let headers : HTTPHeaders = [
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "x-rapidapi-key": "ae4697e8a8mshd3f2b7a47c7813cp16c50cjsnb4cee5498147"
        ]

        AF.request(
            url,
            method: .get,
            headers: headers).responseDecodable(of: CountryDetailResponseModel.self) { [weak self] response in
                if let model = response.value?.data {
                    self?.navigateToDetailView(countryDetail: model)
                }
            }
    }*/
}
