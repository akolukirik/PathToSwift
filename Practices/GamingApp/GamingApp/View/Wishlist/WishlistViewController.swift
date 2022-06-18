//
//  WishlistViewController.swift
//  GamingApp
//
//  Created by ali on 12.06.2022.
//

import UIKit
import Alamofire

class WishlistViewController: UIViewController {

    @IBOutlet var wishlistNavigationBar: UINavigationBar!
    @IBOutlet var wishlistCollectionView: UICollectionView!

    var gameInfoList: [Result]?

    override func viewDidLoad() {
        super.viewDidLoad()

        wishlistNavigationBar.topItem?.title = "Wishlist"

        wishlistCollectionView.dataSource = self
        wishlistCollectionView.delegate = self

        wishlistCollectionView.register(SmallCollectionViewCell.nib(),
                                        forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 171, height: 243)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        wishlistCollectionView.collectionViewLayout = layout
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }

    public func navigateToDetailView(gameDetail: Result) {
        let detailVC = DetailViewController.init(nibName: "DetailViewController", bundle: nil)
        detailVC.gameDetailModel = gameDetail
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
        print("ben gittim")
    }

}

extension WishlistViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameInfoList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = wishlistCollectionView.dequeueReusableCell(withReuseIdentifier: SmallCollectionViewCell.identifier, for: indexPath) as? SmallCollectionViewCell else { return UICollectionViewCell() }

        guard let smallModel = gameInfoList?[indexPath.row] else { return UICollectionViewCell() }

        let gameName = gameInfoList?[indexPath.row].name ?? ""
        let savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        let isSaved2 = savedGame[gameName] ?? false

        cell.configureSmallCell(smallImage: smallModel.backgroundImage,
                                smallName: smallModel.name,
                                smallIndex: indexPath.row,
                                smallIsSaved: isSaved2,
                                smallDelegate: self)

        cell.smallCellSaveButton.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)

        cell.layer.cornerRadius = 10
        
        return cell
    }

    @objc func checkMarkButtonClicked (sender : UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 171, height: 243)
    }

}

extension WishlistViewController: GamesCollectionViewSmallCellDelegate {

    func didTappedSmallCellSave(rowIndex: Int, isSaved: Bool) {
        let gameName = gameInfoList?[rowIndex].name ?? ""
        var savedGame = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        savedGame[gameName] = isSaved
        UserDefaults.standard.set(savedGame, forKey: "savedGames")

        gameInfoList?.remove(at: rowIndex)
        wishlistCollectionView.reloadData()
    }

    func didTappedSmallCellGame(rowIndex: Int) {
        let gameID = gameInfoList?[rowIndex].id ?? 0
        self.getData2(getGameID: gameID)
        print("aaaaaaa")
    }
}

extension WishlistViewController {

    func getData() {

        let savedGames = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]

        let url = "https://api.rawg.io/api/games?key=3a214e197fa048de96a0e8ddf1c49afb"

        AF.request(url, method: .get).responseDecodable(of: GameApi.self) { [weak self] response in
            self?.gameInfoList = []
            if let models = response.value?.results {
                for item in models {
                    let gameName = item.name ?? ""
                    let isSaved = savedGames[gameName] ?? false
                    if isSaved {
                        self?.gameInfoList?.append(item)
                    }
                }
                //self?.gameInfoList = models.results ?? []
                self?.wishlistCollectionView.reloadData()
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
