//
//  EarthquakeTableViewCell.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import UIKit

class EarthquakeTableViewCell: UITableViewCell {

    @IBOutlet weak var readableLocationLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!


    public func configure(locaiton:String?,
                          latitude: Double?,
                          longitude: Double?,
                          size: Double?) {
        readableLocationLabel.text = "Location: \(locaiton ?? "")"
        latitudeLabel.text = "Latitude: \(String(latitude ?? 0.0))"
        longitudeLabel.text = "Longitude: \(String(longitude ?? 0.0))"
        sizeLabel.text = "Size: \(String(size ?? 0.0))"
    }
    
}
