//
//  DetailViewController.swift
//  GamingApp
//
//  Created by ali on 2.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var navigationView: UINavigationBar!
    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var gameDescriptionsLabel: UILabel!
    @IBOutlet var metacriticPointLabel: UILabel!

    var gameDetailModel: Result?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.topItem?.title = "Game Detail"
        navigationView.tintColor = .white

        let rightButton = UIBarButtonItem(image: UIImage(named: "Gift1"), style: .plain, target: self, action: #selector(tab))
        rightButton.tintColor = .white
        navigationView.topItem?.rightBarButtonItem = rightButton

        let button = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        button.tintColor = .white
        navigationView.topItem?.leftBarButtonItem = button

        gameNameLabel.text = gameDetailModel?.name
        detailImageView.setImage(imageURL: gameDetailModel?.backgroundImage ?? "")
        metacriticPointLabel.text = String(gameDetailModel?.metacritic ?? 0)
        
        if gameDetailModel?.metacritic ?? 0 >= 75 {
            metacriticPointLabel.layer.borderColor = UIColor.green.cgColor
            metacriticPointLabel.layer.borderWidth = 2.0
            metacriticPointLabel.textColor = UIColor.green
        } else if gameDetailModel?.metacritic ?? 0 >= 50 {
            metacriticPointLabel.layer.borderColor = UIColor.yellow.cgColor
            metacriticPointLabel.layer.borderWidth = 2.0
            metacriticPointLabel.textColor = UIColor.yellow
        } else {
            metacriticPointLabel.layer.borderColor = UIColor.red.cgColor
            metacriticPointLabel.layer.borderWidth = 2.0
            metacriticPointLabel.textColor = UIColor.red
        }

    }

    @objc func tab() {
        print("test")
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
