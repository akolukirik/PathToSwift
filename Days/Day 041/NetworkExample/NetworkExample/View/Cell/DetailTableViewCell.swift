//
//  DetailTableViewCell.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!

    func configure(name: String) {
        nameLabel.text = name
    }
    
}
