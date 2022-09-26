//
//  ViewController.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var kisilerTableView: UITableView!

    var kisilerListe = [Kisiler]()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self

        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "123123123")
        let k2 = Kisiler(kisi_id: 1, kisi_ad: "qweqwe", kisi_tel: "56435")
        let k3 = Kisiler(kisi_id: 1, kisi_ad: "asdasd", kisi_tel: "3333")

        kisilerListe.append(k1)
        kisilerListe.append(k2)
        kisilerListe.append(k3)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = kisi
        }
    }

}

extension AnasayfaVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonucu: \(searchText)")
    }

}

extension AnasayfaVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre" , for: indexPath) as! TableViewHucre

        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"

        return hucre
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let silAction = UIContextualAction(style: .destructive, title: "Sil") {(contextualAction, view, bool) in
            let kisi = self.kisilerListe[indexPath.row]

            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)

            let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { action in }
            alert.addAction(iptalAction)

            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                print("\(kisi.kisi_ad!) silindi")
                self.kisilerListe.remove(at: indexPath.row)
                tableView.reloadData()

            }
            alert.addAction(evetAction)

            self.present(alert, animated: true)

        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }


}
