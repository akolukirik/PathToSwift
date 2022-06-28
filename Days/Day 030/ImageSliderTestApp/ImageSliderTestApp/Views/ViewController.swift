//
//  ViewController.swift
//  ImageSliderTestApp
//
//  Created by ali on 28.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    var nowPlayingMovieList: [NowPlayingMovieModelResult]?

    override func viewDidLoad() {
        super.viewDidLoad()
        getNowPlayingData()

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(BigCellCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: BigCellCollectionViewCell.identifier)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNowPlayingData()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCellCollectionViewCell.identifier, for: indexPath) as! BigCellCollectionViewCell

        let model = nowPlayingMovieList?[indexPath.row]

        cell.configure(image: model?.posterPath, name: model?.title, description: model?.overview)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 414)
    }
}

extension ViewController {

    func getNowPlayingData() {
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=62e3f1018136eaf84ab9ef75fafaf678&language=en-US&page=1"

        AF.request(url,
                   method: .get).responseDecodable(of: NowPlayingMovieModel.self) { [weak self] response in
            if let npModel = response.value {
                self?.nowPlayingMovieList = npModel.results ?? []
            }
        }
    }
}
