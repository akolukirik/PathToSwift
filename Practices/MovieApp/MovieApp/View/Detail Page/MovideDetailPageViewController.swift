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

    var movieDetailModel: NowPlayingMovieResults?

    let baseURL = "https://image.tmdb.org/t/p/w1280/"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.topItem?.title = movieDetailModel?.originalTitle

        let button = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        navigationView.topItem?.leftBarButtonItem = button
        
        movieDetailNameLabel.text = movieDetailModel?.title
        movieDetailImageView.setImage(imageURL:baseURL + (movieDetailModel?.posterPath ?? "") )
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
