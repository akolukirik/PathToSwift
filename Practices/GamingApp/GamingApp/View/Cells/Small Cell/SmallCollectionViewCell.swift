//
//  SmallCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 29.05.2022.
//

import UIKit

protocol GamesCollectionViewCellDelegate2 {
    func didTappedBigCellGame2(rowIndex: Int)
}

class SmallCollectionViewCell: UICollectionViewCell {

    @IBOutlet var smallImageView: UIImageView!
    @IBOutlet var smallNameLabel: UILabel!
    @IBOutlet var smallCellContainerView: UIView!

    static let identifier = "SmallCollectionViewCell"

    private var cellIndex2: Int = 1
    private var delegate2: GamesCollectionViewCellDelegate2?

    public func configureSmallCell(smallImage: String?,
                          smallName: String?,
                                   index2: Int,
                                   delegate2: GamesCollectionViewCellDelegate2) {

        smallImageView.setImage(imageURL: smallImage ?? "" )
        smallNameLabel.text = smallName
        self.cellIndex2 = index2
        self.delegate2 = delegate2

        smallCellContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate2?.didTappedBigCellGame2(rowIndex: cellIndex2)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "SmallCollectionViewCell", bundle: nil)
    }

}
