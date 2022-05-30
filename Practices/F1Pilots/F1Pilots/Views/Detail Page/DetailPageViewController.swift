//
//  DetailPageViewController.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import UIKit

class DetailPageViewController: UIViewController {

    @IBOutlet var navigationView: UINavigationBar!
    @IBOutlet weak var pilotImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!

    var pilotDetailModel: PilotDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationView.topItem?.title = pilotDetailModel?.team

        let button = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        navigationView.topItem?.leftBarButtonItem = button

        ageLabel.text = String(pilotDetailModel?.age ?? 0)
        teamLabel.text = pilotDetailModel?.team
        pilotImageView.setImage(imageURL: pilotDetailModel?.image ?? "")
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
