//
//  DetailsTableViewCell.swift
//  Earthquake
//
//  Created by ali on 12.05.2022.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {


    @IBOutlet weak var readableLocationLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!

     var earthquakes: Result! {
        didSet{
            readableLocationLabel.text = "Location: \(earthquakes.humanReadableLocation ?? "")"
            latitudeLabel.text = "Latitude: \(String(earthquakes.latitude!))"
            longitudeLabel.text = "Longitude: \(String(earthquakes.longitude!))"
            sizeLabel.text = "Size: \(String(earthquakes.size!))"
        }
    }
}
