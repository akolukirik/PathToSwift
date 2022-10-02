//
//  ViewController.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var dunyaninEnGuzelListesi: [Result]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DetailTableViewCell.nameOfClass,
                                 bundle: nil),
                           forCellReuseIdentifier: DetailTableViewCell.nameOfClass)
        fecthAllCharacters()
        fetchCharacterDetails(testID: 2)
    }

    private let characterListService : ServiceProtocol = Service()

    func fecthAllCharacters() {
        characterListService.fetchCharacters { (models) in
            self.dunyaninEnGuzelListesi = models?.results
            self.tableView.reloadData()
        } onError: { (data) in
            print(data)
        }
    }

    func fetchCharacterDetails(testID: Int) {
        characterListService.getCharacterDetail(characterID: testID, onSuccess: { (models) in
            print(models?.name ?? "Olmadıııı kiii")
            print(models?.species ?? "Ağlaa")
        }, onError: { (data) in
            print(data)
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dunyaninEnGuzelListesi?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.nameOfClass) as? DetailTableViewCell else { return UITableViewCell() }

        guard let model = dunyaninEnGuzelListesi?[indexPath.row] else { return UITableViewCell() }

        cell.configure(name: model.name ?? "")

        return cell
    }
}
