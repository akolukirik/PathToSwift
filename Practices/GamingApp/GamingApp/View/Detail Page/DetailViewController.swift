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

    var gameDetailModel: Result?

    override func viewDidLoad() {
        super.viewDidLoad()

       navigationView.topItem?.title = "Game Detail"

        let button = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        navigationView.topItem?.leftBarButtonItem = button

        gameNameLabel.text = gameDetailModel?.name
        detailImageView.setImage(imageURL: gameDetailModel?.backgroundImage ?? "")
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

}
