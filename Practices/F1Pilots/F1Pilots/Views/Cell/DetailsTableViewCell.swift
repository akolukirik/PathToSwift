//
//  DetailsTableViewCell.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import UIKit

protocol PilotsTableViewCellDelegate {
    func didTappedPilot(rowIndex: Int)
}

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    private var delegate: PilotsTableViewCellDelegate?

    private var cellIndex: Int = 5

    public func configure(name:String?, point: Int?, index: Int, delegate: PilotsTableViewCellDelegate?) {
        nameLabel.text = "Name: \(name ?? "")"
        pointLabel.text = "Point: \( Int(point ?? 0))"
        self.delegate =  delegate
        self.cellIndex = index
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        print("aaa")
        delegate?.didTappedPilot(rowIndex: cellIndex)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
