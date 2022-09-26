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

    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self

        AnasayfaRouter.createModule(ref: self)

    }

    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisileriYukle()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = kisi
        }
    }

}

extension AnasayfaVC: PresenterToViewAnsayfaProtocol {
    func vieweVeriGonder(kisilerListesi: Array<Kisiler>) {
        self.kisilerListe = kisilerListesi
        self.kisilerTableView.reloadData()
    }
}


extension AnasayfaVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
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
                self.anasayfaPresenterNesnesi?.sil(kisi_id: indexPath.row)
               // self.kisilerListe.remove(at: indexPath.row)
                tableView.reloadData()

            }
            alert.addAction(evetAction)

            self.present(alert, animated: true)

        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }


}
