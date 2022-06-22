//
//  UpcomingMovieTableViewCell.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import UIKit
import Kingfisher

class UpcomingMovieTableViewCell: UITableViewCell {

    @IBOutlet var upcomingMovieNameLabel: UILabel!
    @IBOutlet var upcomingMovieImageView: UIImageView!
    @IBOutlet var upcomingMovieDescriptionLabel: UILabel!
    @IBOutlet var upcomingMovieDateLabel: UILabel!

    let baseURL = "https://image.tmdb.org/t/p/w1280"

    public func configure(name:String?,
                          description: String?,
                          date: String?,
                          movieImage: String?) {
        upcomingMovieNameLabel.text = name
        upcomingMovieDescriptionLabel.text = description
        upcomingMovieDateLabel.text = date
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
