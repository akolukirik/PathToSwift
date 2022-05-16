//
//  DetailsTableViewCell.swift
//  RickAndMorty
//
//  Created by ali on 16.05.2022.
//


import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var photosImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!

    var RAMInfo: Result! {
          didSet{
              nameLabel.text = "Name: \(RAMInfo.name ?? "")"
              statusLabel.text = "Status: \(RAMInfo.status?.rawValue ?? "")"
              speciesLabel.text = "Species: \(RAMInfo.species?.rawValue ?? "")"
              photosImageView.setImage(imageURL: RAMInfo.image ?? "")
        }
      }
}
