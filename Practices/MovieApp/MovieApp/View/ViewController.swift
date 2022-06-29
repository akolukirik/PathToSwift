//
//  ViewController.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var pageView: UIPageControl!

    public var upcomingMovieList: [UpcomingMovieResult]?
    public var nowPlayingMovieList: [NowPlayingMovieModelResult]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UpcomingMovieTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "UpcomingMovieTableViewCell")

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NowPlayingCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: NowPlayingCollectionViewCell.identifier)

        pageView.hidesForSinglePage = true
        pageView.numberOfPages = nowPlayingMovieList?.count ?? 1

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        getNowPlayingData()
        pageView.numberOfPages = nowPlayingMovieList?.count ?? 1

    }

    func navigateToDetailView(movieDetail: MovieDetailModel) {
        let detailVC = MovideDetailPageViewController.init(nibName: "MovideDetailPageViewController", bundle: nil)
        detailVC.movieDetail = movieDetail
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
        print(nowPlayingMovieList?.count ?? 1)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingMovieList?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier:"UpcomingMovieTableViewCell") as? UpcomingMovieTableViewCell else { return UITableViewCell() }

        guard let model = upcomingMovieList?[indexPath.row] else { return UITableViewCell() }

        cell.configure(name: model.title,
                       description: model.overview,
                       date: model.releaseDate,
                       image: model.posterPath,
                       index: indexPath.row,
                       delegate: self)
        return cell
    }
}

extension ViewController: MoviesTableViewCellDelegate {

    func didTappedMovie(rowIndex: Int) {
        let movieCode = upcomingMovieList?[rowIndex].id ?? 0
        self.getMovieDetail(movieID: movieCode)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingMovieList?.count ?? 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell

        let collectionViewModel = nowPlayingMovieList?[indexPath.row]

        cell2?.configure2(image: collectionViewModel?.posterPath,
                          name: collectionViewModel?.title,
                          description: collectionViewModel?.overview)

        return cell2!
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageView.currentPage = indexPath.row
    }
}

extension ViewController {

    func getMovieDetail(movieID: Int) {

        let nowPlayURL = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=fa15e2389e4b88860c9e9d706eb452f3"

        AF.request(nowPlayURL,
                   method: .get).responseDecodable(of: MovieDetailModel.self) { [weak self] response in
            if let mdModel = response.value {
                self?.navigateToDetailView(movieDetail: mdModel)
            }
        }
    }
}
