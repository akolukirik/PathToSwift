//
//  PilotsTableViewCell.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//

import UIKit

protocol PilotsTableViewCellDelegate {
    func didTappedSave(rowIndex: Int, isSaved: Bool)
}

class PilotsTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var saveButton: UIButton!

    private var cellIndex: Int = 0
    private var delegate: PilotsTableViewCellDelegate?
    private var isSaved: Bool = false

    public func cellConfigure(name: String?,
                              point: Int?, index: Int,
                              isSaved: Bool,
                              delegate: PilotsTableViewCellDelegate) {
        nameLabel.text = "Name: \(name ?? "")"
        pointLabel.text = "Point: \(point ?? 0)"
        self.cellIndex = index
        self.delegate = delegate
        self.isSaved = isSaved

        setSaveButtonColor(isSaved: isSaved)
    }

    @IBAction func saveButtonTapped() {
        saveButton.isSelected = false
        isSaved.toggle()
        setSaveButtonColor(isSaved: isSaved)
        delegate?.didTappedSave(rowIndex: cellIndex, isSaved: isSaved)
    }

    func setSaveButtonColor(isSaved: Bool) {
        if isSaved == true {
            saveButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

        } else {
            saveButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
