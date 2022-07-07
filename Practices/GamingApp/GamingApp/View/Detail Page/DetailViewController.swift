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
    @IBOutlet var metacriticPointLabel: UILabel!
    @IBOutlet var descriptionsView: UIView!
    @IBOutlet var gameDescriptionsTextView: UITextView!
    @IBOutlet var detailSaveButton: UIBarButtonItem!
    @IBOutlet var redditView: UIView!
    @IBOutlet var websiteView: UIView!

    var gameDetailModel: Result?

    private var isSavedGame: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionsView.layer.cornerRadius = 10
        redditView.layer.cornerRadius = 10
        websiteView.layer.cornerRadius = 10

        navigationView.topItem?.title = "Game Detail"
        navigationView.tintColor = .white

        let rightButton = UIBarButtonItem(image: UIImage(named: "Gift1"), style: .plain, target: self, action: #selector(detailPageSaveButtonTapped))
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

        let savedGames = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        isSavedGame = savedGames[gameDetailModel?.name ?? ""] ?? false
        setSaveButtonColor(isSaved: isSavedGame)

    }

    @objc func detailPageSaveButtonTapped() {
        isSavedGame.toggle()
        setSaveButtonColor(isSaved: isSavedGame)

        var savedCountries = UserDefaults.standard.object(forKey: "savedGames") as? [String: Bool] ?? [:]
        savedCountries[gameDetailModel?.name ?? ""] = isSavedGame
        UserDefaults.standard.set(savedCountries, forKey: "savedGames")
    }

    func setSaveButtonColor(isSaved: Bool) {
        navigationView.topItem?.rightBarButtonItem?.tintColor = isSaved ? .green : .white
    }

    @IBAction func openRedditPage(_ sender: Any) {
    }

    @IBAction func openWebsitePage(_ sender: Any) {
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
