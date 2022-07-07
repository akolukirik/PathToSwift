//
//  ViewController.swift
//  GamingApp
//
//  Created by ali on 28.05.2022.
//

import UIKit
import Alamofire
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet var navigationView: UINavigationBar!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var rightButton: UIBarButtonItem!

    @IBOutlet var pcCollectionView: CustomView!
    @IBOutlet var psCollectionView: CustomView!
    @IBOutlet var xboxCollectionView: CustomView!
    @IBOutlet var iOSCollectionView: CustomView!
    @IBOutlet var androidCollectionView: CustomView!
    @IBOutlet var nintendoCollectionView: CustomView!

    var gameInfoList: [Result]?

    public var cellWidth = 358
    public var cellHeight = 360

    var counter: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        pcCollectionView.configureView(title: " PC ")
        psCollectionView.configureView(title: " PlayStation ")
        xboxCollectionView.configureView(title: " Xbox ")
        iOSCollectionView.configureView(title: " iOS ")
        androidCollectionView.configureView(title: " Android ")
        nintendoCollectionView.configureView(title: " Nintendo ")

        navigationView.topItem?.title = "Games"
        rightButton = UIBarButtonItem(image: UIImage(named: "Button1"), style: .plain, target: self, action: #selector(tab))
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
        collectionView.reloadData()
        if counter == true {
            counter.toggle()
            cellWidth = 171
            cellHeight = 243
            rightButton.image = UIImage(named: "Button2")
            
        } else {
            counter.toggle()
            cellWidth = 358
            cellHeight = 360
            rightButton.image = UIImage(named: "Button1")
        }
    }

    public func navigateToDetailView(gameDetail: Result) {
        let detailVC = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
        detailVC.gameDetailModel = gameDetail
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
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

        if counter == false {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCollectionViewCell.identifier, for: indexPath) as? SmallCollectionViewCell else { return UICollectionViewCell() }

            guard let smallModel = gameInfoList?[indexPath.row] else { return UICollectionViewCell() }

            let gameName = gameInfoList?[indexPath.row].name ?? ""
            let savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
            let isSaved2 = savedGame[gameName] ?? false

            cell.configureSmallCell(smallImage: smallModel.backgroundImage,
                                    smallName: smallModel.name,
                                    smallIndex: indexPath.row,
                                    smallIsSaved: isSaved2,
                                    smallDelegate: self)

            cell.layer.cornerRadius = 10
            
            return cell

        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCellCollectionViewCell.identifier, for: indexPath) as? BigCellCollectionViewCell else { return UICollectionViewCell() }

            guard let model = gameInfoList?[indexPath.row] else { return UICollectionViewCell() }

            let gameName = gameInfoList?[indexPath.row].name ?? ""
            let savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
            let isSaved = savedGame[gameName] ?? false

            cell.configure(image: model.backgroundImage,
                           name: model.name,
                           releaseDate: model.released,
                           genres: model.genres,
                           playTime: model.playtime,
                           score: model.metacritic,
                           index: indexPath.row,
                           isSaved: isSaved,
                           platforms: model.platforms,
                           delegate: self)

            cell.layer.cornerRadius = 10

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

extension ViewController: GamesCollectionViewCellDelegate {

    func didTappedBigCellSave(rowIndex: Int, isSaved: Bool) {
        let gameName = gameInfoList?[rowIndex].name ?? ""
        var savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        savedGame[gameName] = isSaved
        UserDefaults.standard.set(savedGame, forKey: "savedGames")
    }

    func didTappedBigCellGame(rowIndex: Int) {
        let gameID = gameInfoList?[rowIndex].id ?? 0
        self.getDetail(getGameID: gameID)
    }
}

extension ViewController: GamesCollectionViewSmallCellDelegate {

    func didTappedSmallCellSave(rowIndex: Int, isSaved: Bool) {
        let gameName = gameInfoList?[rowIndex].name ?? ""
        var savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        savedGame[gameName] = isSaved
        UserDefaults.standard.set(savedGame, forKey: "savedGames")
    }

    func didTappedSmallCellGame(rowIndex: Int) {
        let gameID = gameInfoList?[rowIndex].id ?? 0
        self.getDetail(getGameID: gameID)
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

    func getDetail(getGameID: Int) {

        let url = "https://api.rawg.io/api/games/\(getGameID)?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: Result.self) { [weak self] response in
            if let model2 = response.value {
                self?.navigateToDetailView(gameDetail: model2)
            }
        }
    }

   /* func getDetail(getGameID: Int) {

        let url = "https://api.rawg.io/api/games/\(getGameID)?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: Result.self) { [weak self] response in
            if let model2 = response.value {
                self?.navigateToDetailView(gameDetail: model2, test: <#GameApi#>)
            }
        }
    }*/
}
