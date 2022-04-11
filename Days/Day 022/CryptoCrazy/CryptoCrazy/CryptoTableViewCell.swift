//
//  CryptoTableViewCell.swift
//  CryptoCrazy
//
//  Created by ali on 10.04.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencytext: UILabel!
    @IBOutlet weak var priceText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
