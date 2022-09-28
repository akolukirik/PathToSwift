//
//  DetailsTableViewCell.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var photosImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!

    func configure(nameLabel: String,
                   statusLabel: String,
                   speciesLabel: String,
                   photosImageView: String) {
        self.nameLabel.text = nameLabel
        self.statusLabel.text = statusLabel
        self.speciesLabel.text = speciesLabel
        self.photosImageView.setImage(imageURL: photosImageView)
    }
}
