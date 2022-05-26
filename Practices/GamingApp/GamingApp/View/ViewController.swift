//
//  ViewController.swift
//  GamingApp
//
//  Created by ali on 26.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // https://api.rawg.io/api/games?key=3a214e197fa048de96a0e8ddf1c49afb

    @IBOutlet var tableView: UITableView!

    var gameInfoList: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GameDetailsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "GameDetailsTableViewCell")
        getData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
           return gameInfoList.count
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GameDetailsTableViewCell", for: indexPath) as? GameDetailsTableViewCell {
            cell.gameInfo = self.gameInfoList[indexPath.section]
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController {

    func getData() {

        let url = "https://api.rawg.io/api/games?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: GameApi.self) { [weak self] response in
            if let models = response.value {
                self?.gameInfoList = models.results ?? []
                self?.tableView.reloadData()
            }
        }
    }
}

