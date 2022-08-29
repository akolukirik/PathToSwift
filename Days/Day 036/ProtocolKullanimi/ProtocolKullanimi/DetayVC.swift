//
//  DetayVC.swift
//  ProtocolKullanimi
//
//  Created by ali on 13.08.2022.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet var textFieldGirdi: UITextField!

    var delegate: DetayVCToViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonGonder(_ sender: Any) {
        if let mesaj = textFieldGirdi.text {
            delegate?.veriGonder(mesaj: mesaj)
        }
    }
}
