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

    var gameInfoList: [Result] = []

    override func viewDidLoad() {

        super.viewDidLoad()

        getData()

        navigationView.topItem?.title = "Games"

        let myImage = UIImage(named: "Button1.png")

        let rightButton = UIBarButtonItem(image: myImage, style: .plain, target: self, action: #selector(tab))
        navigationView.topItem?.rightBarButtonItem = rightButton


        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(BigCellCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: BigCellCollectionViewCell.identifier)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 358, height: 360)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView.collectionViewLayout = layout

    }

    @objc func tab() {
        print("qweqwe")
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("aaaaaaa")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameInfoList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigCellCollectionViewCell.identifier, for: indexPath) as! BigCellCollectionViewCell
        cell.gameInfo = self.gameInfoList[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 358, height: 360)
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
}
