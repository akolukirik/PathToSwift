//
//  SecondViewController.swift
//  FBLoginApp
//
//  Created by Ali Kolukirik on 19.10.2022.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            // navigate et
        } catch {
            print("error")
        }
    }

}
