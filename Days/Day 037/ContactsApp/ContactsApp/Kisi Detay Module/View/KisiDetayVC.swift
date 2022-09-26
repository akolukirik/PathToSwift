//
//  KisiDetayVC.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet var tfKisiAd: UITextField!
    @IBOutlet var tfKisiTel: UITextField!

    var kisi: Kisiler?

    var kisiDetayPresenterNesnesi: ViewToPresenterKisiDetayProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            tfKisiAd.text = k.kisi_ad ?? ""
            tfKisiTel.text = k.kisi_tel ?? ""
        }

        KisiDetayRouter.createModule(ref: self)

    }

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let k = kisi {
            kisiDetayPresenterNesnesi?.kisiGuncelle(kisi_id: k.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
}
