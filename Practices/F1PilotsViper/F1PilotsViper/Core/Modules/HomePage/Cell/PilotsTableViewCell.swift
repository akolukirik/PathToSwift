//
//  PilotsTableViewCell.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//


/// Cell'e özel olacak şekilde presenter yap.
/// Fonksiyonlar buradan tetiklenecek.
/// 

import UIKit

protocol PilotsTableViewCellDelegate {
    func didTappedSave(rowIndex: Int, isSaved: Bool)
    func didTappedPilot(rowIndex: Int)
}

class PilotsTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var containerView: UIView!

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
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))
    }

    @objc func containerViewTapped() {
        delegate?.didTappedPilot(rowIndex: cellIndex)
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
