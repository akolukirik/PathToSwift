//
//  ViewController.swift
//  AlertProject
//
//  Created by ali on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordFirst: UITextField!
    @IBOutlet weak var passwordSecond: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signupClick(_ sender: Any) {
        
        let name = userName.text
        let pass = passwordFirst.text
        let pass2 = passwordSecond.text
        
        if name == "" {
            makeAler(titleInput: "Error", messageInput: "Kullanıcı adını unuttun")
        } else if pass != pass2 || pass == "" {
            makeAler(titleInput: "Error", messageInput: "Şifren hatalı :S")
        } else {
            makeAler(titleInput: "Succes", messageInput: "helal olsunn")
        }
    }
    
    func makeAler(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

