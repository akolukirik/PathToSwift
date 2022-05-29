//
//  SmallCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 29.05.2022.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {

    @IBOutlet var smallImageView: UIImageView!
    @IBOutlet var smallNameLabel: UILabel!

    static let identifier = "SmallCollectionViewCell"

    public func configureSmallCell(smallImage: String?,
                          smallName: String?) {

        smallImageView.setImage(imageURL: smallImage ?? "" )
        smallNameLabel.text = smallName
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "SmallCollectionViewCell", bundle: nil)
    }

}
