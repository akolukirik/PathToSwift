//
//  ViewController.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var upcomingMovieList: [UpcomingMovieModelResults]?
    var nowPlayingMovieList: [NowPlayingMovieResults]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UpcomingMovieTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "UpcomingMovieTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        getNowPlayData()
    }

    func navigateToDetailView() {
        let detailVC = MovideDetailPageViewController.init(nibName: "MovideDetailPageViewController", bundle: nil)
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingMovieList?.count ?? 0
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
       // let pilotCode = pilotsList?[rowIndex].id ?? 0
      //  self.getPilotDetail(pilotID: pilotCode )
    }
}

extension ViewController {

    func getData() {
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=fa15e2389e4b88860c9e9d706eb452f3"

        AF.request(url,
                   method: .get).responseDecodable(of: UpcomingMovieModel.self) { [weak self] response in
            if let model = response.value {
                self?.upcomingMovieList = model.results ?? []
                self?.tableView.reloadData()
            }
        }
    }

    func getNowPlayData(movieID: Int) {

        let nowPlayUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=fa15e2389e4b88860c9e9d706eb452f3"

        AF.request(nowPlayUrl,
                   method: .get).responseDecodable(of: NowPlayingMovieModel.self) { [weak self] response in
            if let npModel = response.value {
                self?.nowPlayingMovieList = npModel.results ?? []
                self?.tableView.reloadData()
            }
        }



    }
}
