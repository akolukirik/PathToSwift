//
//  HomePageViewController.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//

import UIKit

protocol AnyView: AnyObject {
    func update()
}

class HomePageViewController: UIViewController, AnyView {

    var presenter: IPilotsPresenter!

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PilotsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "PilotsTableViewCell")
    }

    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:"PilotsTableViewCell") as? PilotsTableViewCell else { return UITableViewCell() }

        let model = presenter.getItem(index: indexPath.row)

        let pilotName = model.name ?? ""
        let savedPilot = UserDefaults.standard.object(forKey: "savedPilots") as? [String: Bool] ?? [:]
        let isSaved = savedPilot[pilotName] ?? false


        cell.cellConfigure(name: model.name,
                           point: model.point,
                           index: indexPath.row,
                           isSaved: isSaved,
                           delegate: self)

        cell.selectionStyle = .none
        cell.saveButton.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)

        return cell
    }

    @objc func checkMarkButtonClicked (sender : UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension HomePageViewController: PilotsTableViewCellDelegate {
    func didTappedSave(rowIndex: Int, isSaved: Bool) {
//        let pilotName = pilotsList?[rowIndex].name ?? ""
//        var savedPilot = UserDefaults.standard.object(forKey: "savedPilots") as? [String: Bool] ?? [:]
//        savedPilot[pilotName] = isSaved
//        UserDefaults.standard.set(savedPilot, forKey: "savedPilots")
    }

    func didTappedPilot(rowIndex: Int) {
        presenter.didTappedPilot(index: rowIndex)
    }
}
    