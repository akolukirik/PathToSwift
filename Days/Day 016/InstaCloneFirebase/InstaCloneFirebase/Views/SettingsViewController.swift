//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by ali on 1.03.2022.
//
import Firebase
import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("çıkış hatası")
        }
        
    }
    
}
