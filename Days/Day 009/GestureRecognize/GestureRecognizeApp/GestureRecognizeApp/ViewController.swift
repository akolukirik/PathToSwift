//
//  ViewController.swift
//  GestureRecognizeApp
//
//  Created by ali on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var name = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true // tıklanma durumuyla ilgili bool
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changeImage() {
        
        if name == true {
            imageView.image = UIImage(named: "1")
            nameLabel.text = "rick"
            name = false
        } else {
            imageView.image = UIImage(named: "2")
            nameLabel.text = "morty"
            name = true
        }
        
    }
    
}

