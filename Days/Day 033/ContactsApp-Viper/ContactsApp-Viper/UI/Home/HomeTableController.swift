//
//  HomeTableController.swift
//  ContactsApp-Viper
//
//  Created by ali on 18.07.2022.
//

import UIKit

class HomeTableController: UITableViewController {
    var presenter: HomePresenterProtocol!

    var contactList: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Test")
        presenter.getContact()
    }
}

extension HomeTableController: HomeViewProtocol {
    func showContact(contact: [Contact]) {
        self.contactList = contact
        tableView.reloadData()
    }
}

extension HomeTableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let contact = contactList[indexPath.row]
        cell.textLabel?.text = "\(contact.fullname) - \(contact.gsm)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        //presenter.showContactDetail(contact: contactList[indexPath.row])
    }
}
