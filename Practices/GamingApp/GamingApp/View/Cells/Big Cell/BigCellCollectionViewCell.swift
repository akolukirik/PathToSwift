//
//  BigCellCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 28.05.2022.
//

import UIKit

protocol GamesCollectionViewCellDelegate {
    func didTappedBigCellGame(rowIndex: Int)
}

class BigCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var bigImageView: UIImageView!
    @IBOutlet var bigNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var playTimeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var bigCellSaveButton: UIButton!

    static let identifier = "BigCellCollectionViewCell"

    private var cellIndex: Int = 1
    private var delegate: GamesCollectionViewCellDelegate?

    public func configure(image: String?,
                          name: String?,
                          releaseDate: String?,
                          genres: [Genre]?,
                          playTime: Int?,
                          score: Int?,
                          index: Int,
                          delegate: GamesCollectionViewCellDelegate) {

        bigImageView.setImage(imageURL: image ?? "" )
        bigNameLabel.text = name
        releaseDateLabel.text = releaseDate
        //genresLabel.text = genres.map( {($0.name ?? "")}).joined(separator: ",")
        genresLabel.text = "Working on.."
        playTimeLabel.text = String(playTime!)
        scoreLabel.text = String(score!)
        if score ?? 0 >= 75 {
            scoreLabel.layer.borderColor = UIColor.green.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.green
        } else if score ?? 0 >= 50 {
            scoreLabel.layer.borderColor = UIColor.yellow.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.yellow
        } else {
            scoreLabel.layer.borderColor = UIColor.red.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.red
        }

        self.cellIndex = index
        self.delegate = delegate

        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))

    }

    @objc func containerViewTapped() {
        delegate?.didTappedBigCellGame(rowIndex: cellIndex)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "BigCellCollectionViewCell", bundle: nil)
    }

}
