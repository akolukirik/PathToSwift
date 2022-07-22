//
//  PilotsTableViewCell.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//

import UIKit

class PilotsTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!

    public func cellConfigure(name: String?,
                              point: Int?) {
        nameLabel.text = "Name: \(name ?? "")"
        pointLabel.text = "Point: \(point ?? 0)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
