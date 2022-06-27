//
//  MovideDetailPageViewController.swift
//  MovieApp
//
//  Created by ali on 26.06.2022.
//

import UIKit

class MovideDetailPageViewController: UIViewController {

    @IBOutlet var navigationView: UINavigationBar!
    @IBOutlet var movieDetailNameLabel: UILabel!
    @IBOutlet var movieDetailImageView: UIImageView!
    @IBOutlet var movieDetailIMDBLabel: UILabel!
    @IBOutlet var movieDetailDateLabel: UILabel!
    @IBOutlet var movieDescriptionTextView: UITextView!

    var movieDetail: MovieDetailModel?

    let baseURL = "https://image.tmdb.org/t/p/w1280/"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.topItem?.title = movieDetail?.originalTitle

        let button = UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .plain, target: self, action: #selector(goBack))
        button.tintColor = .black
        navigationView.topItem?.leftBarButtonItem = button
        
        movieDetailNameLabel.text = movieDetail?.title
        movieDetailImageView.setImage(imageURL:baseURL + (movieDetail?.posterPath ?? "") )
        movieDetailIMDBLabel.text = String (format:"%.1f", movieDetail?.voteAverage ?? 0.0) + "/10"
        movieDetailDateLabel.text = movieDetail?.releaseDate
        movieDescriptionTextView.text = movieDetail?.overview
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
