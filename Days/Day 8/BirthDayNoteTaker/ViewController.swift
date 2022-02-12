//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by ali on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textBDay: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedNames = UserDefaults.standard.object(forKey: "name")
        let savedBDays = UserDefaults.standard.object(forKey: "bday")
        
        //labelName.text = savedNames as? String
        //labelBDay.text = savedBDays as? String
        
        if let newName = savedNames as? String {
            labelName.text = newName
        }
        
        if let newBDay = savedBDays as? String {
            labelBDay.text = newBDay
        }
    }
    
    @IBAction func save(_ sender: Any) {
        
        UserDefaults.standard.set(textName.text, forKey: "name")
        UserDefaults.standard.set(textBDay.text, forKey: "bday")
        
        labelName.text = "Name: \(textName.text ?? "")"
        labelBDay.text = "Birthday: \(textBDay.text ?? "")"
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        
        let sortedName = UserDefaults.standard.object(forKey: "name")
        let sortedBDAy = UserDefaults.standard.object(forKey: "bday")
        
        
        if (sortedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            labelName.text = "Name:"
        }
        
        if (sortedBDAy as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "bday")
            labelBDay.text = "Birthday:"
        }
    }
    
}

