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

    var pilotsList: [Pilot]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "DetailsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "DetailsTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }

    func navigateToDetailView(pilotDetail: PilotDetail) {
        let detailVC = DetailPageViewController.init(nibName: "DetailPageViewController", bundle: nil)
        detailVC.pilotDetailModel = pilotDetail
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
        print("ben gittim")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pilotsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:"DetailsTableViewCell") as? DetailsTableViewCell else { return UITableViewCell() }

        guard let model = pilotsList?[indexPath.row] else { return UITableViewCell() }

        cell.configure(name: model.name, point: model.point, index: indexPath.row, delegate: self)

        return cell
    }
}

extension ViewController: PilotsTableViewCellDelegate {
    func didTappedPilot(rowIndex: Int) {
        let pilotCode = pilotsList?[rowIndex].id ?? 0
        self.getPilotDetail(pilotID: pilotCode )
    }
}

extension ViewController {

    func getData() {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/drivers"

        AF.request(url,
                   method: .get).responseDecodable(of: PilotData.self) { [weak self] response in
            if let model = response.value {
                self?.pilotsList = model.items ?? []
                self?.tableView.reloadData()
            }
        }
    }

    func getPilotDetail(pilotID: Int) {

        let url = "https://my-json-server.typicode.com/akolukirik/demo2/driverDetail/\(pilotID)"

        AF.request(
            url,
            method: .get).responseDecodable(of: PilotDetail.self) { [weak self] response in
                if let model2 = response.value {
                    self?.tableView.reloadData()
                    self?.navigateToDetailView(pilotDetail: model2)
                }
            }
    }
}
