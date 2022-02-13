//
//  SecondViewController.swift
//  SegueApp
//
//  Created by ali on 14.02.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UITextField!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondNameLabel.text = name
        
    }

}
