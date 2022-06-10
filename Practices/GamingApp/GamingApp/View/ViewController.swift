//
//  ViewController.swift
//  GamingApp
//
//  Created by ali on 28.05.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var navigationView: UINavigationBar!
    @IBOutlet var collectionView: UICollectionView!

    var gameInfoList: [Result]?

    public var cellWidth = 358
    public var cellHeight = 360

    var counter = 0

    var myImage = UIImage(named: "Button1")

    override func viewDidLoad() {

        super.viewDidLoad()

        navigationView.topItem?.title = "Games"
        let rightButton = UIBarButtonItem(image: myImage, style: .plain, target: self, action: #selector(tab) )
        rightButton.tintColor = .white
        navigationView.topItem?.rightBarButtonItem = rightButton

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(BigCellCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: BigCellCollectionViewCell.identifier)

        collectionView.register(SmallCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 358, height: 360)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView.collectionViewLayout = layout

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }

    // MARK: - Switch Case??
    @objc func tab() {
        if counter == 0 {
            counter = 1
        } else {
            counter = 0
        }
    }

    public func navigateToDetailView(gameDetail: Result) {
        let detailVC = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
        detailVC.gameDetailModel = gameDetail
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
        print("ben gittim")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameInfoList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if counter == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCollectionViewCell.identifier, for: indexPath) as? SmallCollectionViewCell else { return UICollectionViewCell() }

            guard let smallModel = gameInfoList?[indexPath.row] else { return UICollectionViewCell() }

            cell.configureSmallCell(smallImage: smallModel.backgroundImage,
                                    smallName: smallModel.name)

            cellWidth = 171
            cellHeight = 243
            collectionView.reloadData()

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCellCollectionViewCell.identifier, for: indexPath) as? BigCellCollectionViewCell else { return UICollectionViewCell() }

            guard let model = gameInfoList?[indexPath.row] else { return UICollectionViewCell() }

            cell.configure(image: model.backgroundImage,
                           name: model.name,
                           releaseDate: model.released,
                           genres: model.genres,
                           playTime: model.playtime,
                           score: model.metacritic,
                           index: indexPath.row,
                           delegate: self)

            cellWidth = 358
            cellHeight = 360
            collectionView.reloadData()

            return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

extension ViewController: GamesCollectionViewCellDelegate {

    func didTappedBigCellGame(rowIndex: Int) {
        let pilotCode = gameInfoList?[rowIndex].id ?? 0
        self.getData2(getGameID: pilotCode)
        print("baaasssssssss")

    }
}

extension ViewController {

    func getData() {
        
        let url = "https://api.rawg.io/api/games?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: GameApi.self) { [weak self] response in
            if let models = response.value {
                self?.gameInfoList = models.results ?? []
                self?.collectionView.reloadData()
            }
        }
    }

    func getData2(getGameID: Int) {

        let url = "https://api.rawg.io/api/games/\(getGameID)?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: Result.self) { [weak self] response in
            if let model2 = response.value {
                self?.navigateToDetailView(gameDetail: model2)
            }
        }
    }


}
