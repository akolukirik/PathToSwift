//
//  DetailsTableViewCell.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import UIKit

protocol PilotsTableViewCellDelegate {
    func didTappedPilot(rowIndex: Int)
   // func didTappedSave(rowIndex: Int, isSaved: Bool)
}

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var btnCheck: UIButton!

    private var delegate: PilotsTableViewCellDelegate?

    private var cellIndex: Int = 1
    private var isSaved: Bool = false

    public func configure(name:String?, point: Int?, index: Int, isSaved: Bool, delegate: PilotsTableViewCellDelegate?) {
        nameLabel.text = "Name: \(name ?? "")"
        pointLabel.text = "Point: \( Int(point ?? 0))"
        self.delegate =  delegate
        self.cellIndex = index
        self.isSaved = isSaved

        setSaveButtonColor(isSaved: isSaved)
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate?.didTappedPilot(rowIndex: cellIndex)
    }

    @IBAction func saveButtonTapped() {
        btnCheck.isSelected = false
        isSaved.toggle()
        setSaveButtonColor(isSaved: isSaved)
       // delegate?.didTappedSave(rowIndex: cellIndex, isSaved: isSaved)
    }

    func setSaveButtonColor(isSaved: Bool) {
        btnCheck.tintColor = isSaved ? .systemBlue : .systemRed
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
}
