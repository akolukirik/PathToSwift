//
//  NowPlayingCollectionViewCell.swift
//  MovieApp
//
//  Created by ali on 28.06.2022.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nowPlayingImageView: UIImageView!
    @IBOutlet var nowPlayingMovieName: UILabel!
    @IBOutlet var nowPlayingMovieDescription: UITextView!

    static let identifier = "NowPlayingCollectionViewCell"

    let baseURL = "https://image.tmdb.org/t/p/w1280/"

    public func configure2(image: String?,
                          name: String?,
                          description: String?) {

        nowPlayingImageView.setImage(imageURL:baseURL + (image ?? ""))
        nowPlayingMovieName.text = name
        nowPlayingMovieDescription.text = description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    static func nib() -> UINib {
        return UINib(nibName: "NowPlayingCollectionViewCell", bundle: nil)
    }

}
