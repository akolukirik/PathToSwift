//
//  GameDetailsTableViewCell.swift
//  GamingApp
//
//  Created by ali on 26.05.2022.
//

import UIKit

class GameDetailsTableViewCell: UITableViewCell {

    @IBOutlet var gameImageView: UIImageView!
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var playTimeLabel: UILabel!

    var gameInfo: Result! {
        didSet{
            gameImageView.setImage(imageURL: gameInfo.backgroundImage ?? "")
            gameNameLabel.text = gameInfo.name
            releaseDateLabel.text = gameInfo.released!
            genresLabel.text = gameInfo.genres?.description
            playTimeLabel.text = String(gameInfo.playtime!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
