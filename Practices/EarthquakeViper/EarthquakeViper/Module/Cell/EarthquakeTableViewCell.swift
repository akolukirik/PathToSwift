//
//  EarthquakeTableViewCell.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import UIKit

class EarthquakeTableViewCell: UITableViewCell {

    @IBOutlet var testLabel1: UILabel!
    @IBOutlet var testLabel2: UILabel!

    public func configure(test1:String?,
                          test2: String?) {
        testLabel1.text = "Name: \(test1 ?? "")"
        testLabel2.text = "Name: \(test2 ?? "")"
    }
    
}
