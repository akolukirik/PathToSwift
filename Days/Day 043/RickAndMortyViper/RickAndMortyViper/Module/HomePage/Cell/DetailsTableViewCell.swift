//
//  DetailsTableViewCell.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import UIKit

protocol CharacterTableViewCellDelegate {
    func didTappedCharacter(rowIndex: Int)
}

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var photosImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet var containerView: UIView!

    private var cellIndex: Int = 0
    private var delegate:  CharacterTableViewCellDelegate?

    func configure(nameLabel: String,
                   statusLabel: String,
                   speciesLabel: String,
                   photosImageView: String,
                   index: Int,
                   delegate: CharacterTableViewCellDelegate) {

        self.nameLabel.text = nameLabel
        self.statusLabel.text = statusLabel
        self.speciesLabel.text = speciesLabel
        self.photosImageView.setImage(imageURL: photosImageView)
        self.cellIndex = index
        self.delegate = delegate

       containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate?.didTappedCharacter(rowIndex: cellIndex)
    }

}
