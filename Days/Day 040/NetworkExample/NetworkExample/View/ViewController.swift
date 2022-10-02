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

    var gelenVerininListesi: [Result]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DetailTableViewCell.nameOfClass,
                                 bundle: nil),
                           forCellReuseIdentifier: DetailTableViewCell.nameOfClass)
        fecthAllCharacters()
    }

    private let characterListService : ServiceProtocol = Service()

    func fecthAllCharacters() {
        characterListService.fetchCharacters { (models) in
            self.gelenVerininListesi = models?.results
            self.tableView.reloadData()
        } onError: { (data) in
            print(data)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gelenVerininListesi?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.nameOfClass) as? DetailTableViewCell else { return UITableViewCell() }

        guard let model = gelenVerininListesi?[indexPath.row] else { return UITableViewCell() }

        cell.configure(name: model.name ?? "")

        return cell
    }
}
