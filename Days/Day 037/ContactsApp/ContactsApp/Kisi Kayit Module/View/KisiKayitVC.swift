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

    var kisiKayitPresenterNesnesi: ViewToPresenterKisiKayitProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        KisiKayitRouter.createModule(ref: self)

    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text , let kt = tfKisiTel.text {
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: ka, kisi_tel: kt)
        }
    }

}
