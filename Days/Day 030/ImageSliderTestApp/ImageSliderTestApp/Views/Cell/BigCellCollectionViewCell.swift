//
//  BigCellCollectionViewCell.swift
//  ImageSliderTestApp
//
//  Created by ali on 28.06.2022.
//

import UIKit

class BigCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var testLabel2: UILabel!
    @IBOutlet var testLabel1: UILabel!
    @IBOutlet var testImageView: UIImageView!

    static let identifier = "BigCellCollectionViewCell"

    let baseURL = "https://image.tmdb.org/t/p/w1280/"

    public func configure(image: String?,
                          name: String?,
                          description: String?) {

        testImageView.setImage(imageURL:baseURL + (image ?? ""))
        testLabel1.text = name
        testLabel2.text = description
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    static func nib() -> UINib {
        return UINib(nibName: "BigCellCollectionViewCell", bundle: nil)
    }


}
