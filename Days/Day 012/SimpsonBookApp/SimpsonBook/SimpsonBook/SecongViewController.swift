//
//  SecongViewController.swift
//  SimpsonBook
//
//  Created by ali on 18.02.2022.
//

import UIKit

class SecongViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selected : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selected?.name
        jobLabel.text = selected?.job
        imageView.image = selected?.image
        
        
    }
    

}
