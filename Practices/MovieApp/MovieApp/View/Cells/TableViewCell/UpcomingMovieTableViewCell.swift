//
//  UpcomingMovieTableViewCell.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import UIKit

protocol MoviesTableViewCellDelegate {
    func didTappedMovie(rowIndex: Int)
}

class UpcomingMovieTableViewCell: UITableViewCell {

    @IBOutlet var upcomingMovieNameLabel: UILabel!
    @IBOutlet var upcomingMovieImageView: UIImageView!
    @IBOutlet var upcomingMovieDescriptionLabel: UILabel!
    @IBOutlet var upcomingMovieDateLabel: UILabel!
    @IBOutlet var containerView: UIView!

    let baseURL = "https://image.tmdb.org/t/p/w1280/"

    private var cellIndex: Int = 0
    private var delegate: MoviesTableViewCellDelegate?

    public func configure(name:String?,
                          description: String?,
                          date: String?,
                          image: String?,
                          index: Int,
                          delegate:MoviesTableViewCellDelegate) {

        upcomingMovieNameLabel.text = name
        upcomingMovieDescriptionLabel.text = description
        upcomingMovieDateLabel.text = date
        upcomingMovieImageView.setImage(imageURL: baseURL + (image ?? ""))
        self.cellIndex = index
        self.delegate = delegate

        upcomingMovieImageView.layer.cornerRadius = 10

        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate?.didTappedMovie(rowIndex: cellIndex)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
