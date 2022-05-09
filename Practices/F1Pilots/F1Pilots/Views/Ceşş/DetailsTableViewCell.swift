//
//  DetailsTableViewCell.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!

    var pilots: PilotDetail! {
        didSet{
            nameLabel.text = pilots.name
            pointLabel.text = "Point: \(String(pilots.point!))"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
