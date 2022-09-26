//
//  KisiKayitVC.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import UIKit

class KisiKayitVC: UIViewController {

    @IBOutlet var tfKisiAd: UITextField!
    @IBOutlet var tfKisiTel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text , let kt = tfKisiTel.text {
            kayit(kisi_ad: ka, kisi_tel: kt)
        }
    }

    func kayit(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kayıt: \(kisi_ad) -  \(kisi_tel)")
    }
}
