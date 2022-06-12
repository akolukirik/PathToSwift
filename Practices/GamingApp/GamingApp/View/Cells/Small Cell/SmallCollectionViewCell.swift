//
//  SmallCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 29.05.2022.
//

import UIKit

protocol GamesCollectionViewSmallCellDelegate {
    func didTappedSmallCellGame(rowIndex: Int)
    func didTappedSmallCellSave(rowIndex: Int, isSaved: Bool)
}

class SmallCollectionViewCell: UICollectionViewCell {

    @IBOutlet var smallImageView: UIImageView!
    @IBOutlet var smallNameLabel: UILabel!
    @IBOutlet var smallCellContainerView: UIView!
    @IBOutlet var saveButtonSmallCellContainerView: UIView!
    @IBOutlet var smallCellSaveButton: UIButton!

    static let identifier = "SmallCollectionViewCell"

    private var smallCellIndex: Int = 1
    private var smallCellDelegate: GamesCollectionViewSmallCellDelegate?
    private var smallCellisSaved: Bool = false

    public func configureSmallCell(smallImage: String?,
                          smallName: String?,
                                   smallIndex: Int,
                                   smallIsSaved: Bool,
                                   smallDelegate: GamesCollectionViewSmallCellDelegate) {

        smallImageView.setImage(imageURL: smallImage ?? "" )
        smallNameLabel.text = smallName
        self.smallCellIndex = smallIndex
        self.smallCellDelegate = smallDelegate
        self.smallCellisSaved = smallIsSaved

        setSaveButtonColor2(isSaved: smallIsSaved)

        smallCellContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        smallCellDelegate?.didTappedSmallCellGame(rowIndex: smallCellIndex)
    }

    @IBAction func saveButtonTapped() {
        smallCellSaveButton.isSelected = false
        smallCellisSaved.toggle()
        setSaveButtonColor2(isSaved: smallCellisSaved)
        smallCellDelegate?.didTappedSmallCellSave(rowIndex: smallCellIndex, isSaved: smallCellisSaved)
    }


    func setSaveButtonColor2(isSaved: Bool) {
        if isSaved == true {
            saveButtonSmallCellContainerView.backgroundColor = .green
        } else {
            saveButtonSmallCellContainerView.backgroundColor = .gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "SmallCollectionViewCell", bundle: nil)
    }

}
