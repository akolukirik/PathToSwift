//
//  HomePageViewController.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import UIKit

protocol PresenterToViewHomepageProtocol {
    func reloadTableView()
}

class HomePageViewController: UIViewController, StoryboardLoadable {

    @IBOutlet private var tableView: UITableView!

    var presenter: ViewToPresenterHomepageProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: DetailsTableViewCell.nameOfClass,
                                 bundle: nil),
                           forCellReuseIdentifier: DetailsTableViewCell.nameOfClass)
    }

}

extension HomePageViewController: PresenterToViewHomepageProtocol {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.characterListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.nameOfClass) as? DetailsTableViewCell else { return UITableViewCell() }

        guard let model = presenter.getCharacter(index: indexPath.row) else { return UITableViewCell() }

        cell.configure(nameLabel: model.name ?? "",
                       statusLabel: model.status?.rawValue ?? "",
                       speciesLabel: model.species?.rawValue ?? "",
                       photosImageView: model.image ?? "",
                       index: indexPath.row,
                       delegate: self)

        return cell
    }

}

extension HomePageViewController: CharacterTableViewCellDelegate {
    func didTappedCharacter(rowIndex: Int) {
        presenter.didTappedCharacter(characterID: rowIndex)
    }

}

/*/

 cell tapped'ı cell'in presenter ına gidicek, delegeta ile homepagepresenter a gidecek

 didTappedCharacter(characterID -> index ile değiştir

 */
