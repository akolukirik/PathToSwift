//
//  ViewController.swift
//  RickAndMorty
//
//  Created by ali on 16.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var rickAndMortList: [Result] = []

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
        return 373
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rickAndMortList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
           cell.RAMInfo = self.rickAndMortList[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController {
    func getData() {
        let url = "https://rickandmortyapi.com/api/character"

        AF.request(url, method: .get).responseDecodable(of: RickAndMorty.self) { [weak self] response in
                if let models = response.value {
                    self?.rickAndMortList = models.results ?? []
                    self?.tableView.reloadData()
                }
            }
    }
}
