//
//  BigCellCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 28.05.2022.
//

import UIKit

class BigCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var bigImageView: UIImageView!
    @IBOutlet var bigNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var playTimeLabel: UILabel!

    @IBOutlet var scoreLabel: UILabel!


    static let identifier = "BigCellCollectionViewCell"

    var gameInfo: Result! {
        didSet{
            bigImageView.setImage(imageURL: gameInfo.backgroundImage ?? "")
            bigNameLabel.text = gameInfo.name
            releaseDateLabel.text = gameInfo.released
            genresLabel.text = gameInfo.genres?.map( {($0.name ?? "")}).joined(separator: ",")
            playTimeLabel.text = String(gameInfo.playtime!)
            scoreLabel.text = String(gameInfo.metacritic!)
            if gameInfo.metacritic ?? 0 >= 95 {
                scoreLabel.layer.borderColor = UIColor.green.cgColor
                scoreLabel.layer.borderWidth = 2.0
                scoreLabel.textColor = UIColor.green
            } else if gameInfo.metacritic ?? 0 > 85 {
                scoreLabel.layer.borderColor = UIColor.yellow.cgColor
                scoreLabel.layer.borderWidth = 2.0
                scoreLabel.textColor = UIColor.yellow
            } else {
                scoreLabel.layer.borderColor = UIColor.red.cgColor
                scoreLabel.layer.borderWidth = 2.0
                scoreLabel.textColor = UIColor.red
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "BigCellCollectionViewCell", bundle: nil)
    }

}
