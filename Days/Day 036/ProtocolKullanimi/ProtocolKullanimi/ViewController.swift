//
//  ViewController.swift
//  ProtocolKullanimi
//
//  Created by ali on 13.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelSonuc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonGecisYap(_ sender: Any) {
        performSegue(withIdentifier: "toDetay", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.delegate = self
        }
    }
}

extension ViewController: DetayVCToViewControllerProtocol {
    func veriGonder(mesaj: String) {
        labelSonuc.text = mesaj
    }
}
