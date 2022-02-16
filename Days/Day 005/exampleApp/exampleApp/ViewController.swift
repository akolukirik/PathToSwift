//
//  ViewController.swift
//  exampleApp
//
//  Created by ali on 8.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
               
        imageView.image = UIImage(named: "1")
    }

}
