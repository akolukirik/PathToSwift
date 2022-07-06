//
//  BigCellCollectionViewCell.swift
//  GamingApp
//
//  Created by ali on 28.05.2022.
//

import UIKit

protocol GamesCollectionViewCellDelegate {
    func didTappedBigCellGame(rowIndex: Int)
    func didTappedBigCellSave(rowIndex: Int, isSaved: Bool)
}

class BigCellCollectionViewCell: UICollectionViewCell {

    var platformList : [String]?

    @IBOutlet var bigImageView: UIImageView!
    @IBOutlet var bigNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var playTimeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var saveButtonContainerView: UIView!
    @IBOutlet var bigCellSaveButton: UIButton!

    @IBOutlet var firstCustomView: CustomView!
    @IBOutlet var secondCustomView: CustomView!
    @IBOutlet var thirdCustomView: CustomView!
    @IBOutlet var fourthCustomView: CustomView!

    static let identifier = "BigCellCollectionViewCell"

    private var cellIndex: Int = 1
    private var delegate: GamesCollectionViewCellDelegate?
    private var isSaved: Bool = false


    public func configure(image: String?,
                          name: String?,
                          releaseDate: String?,
                          genres: [Genre]?,
                          playTime: Int?,
                          score: Int?,
                          index: Int,
                          isSaved: Bool,
                          platforms: [PlatformElement]?,
                          delegate: GamesCollectionViewCellDelegate) {

        //print(platforms?.map( {($0.platform?.name ?? "")}).joined(separator: ",") ?? [])
        //print(platforms?.count ?? 0)

        platformList = platforms?.map({($0.platform?.name ?? "")})

        firstCustomView.configureView(title: "\(platformList?[0] ?? "")")
        secondCustomView.configureView(title: "\(platformList?[1] ?? "")")
        thirdCustomView.configureView(title: "\(platformList?[2] ?? "")")

        if (platforms?.count ?? 0) > 4 {
            fourthCustomView.configureView(title: "+\((platforms?.count ?? 0) - 3)")
        }

        firstCustomView.layer.cornerRadius = 10
        secondCustomView.layer.cornerRadius = 10
        thirdCustomView.layer.cornerRadius = 10
        fourthCustomView.layer.cornerRadius = 10

        bigImageView.setImage(imageURL: image ?? "" )
        bigNameLabel.text = name
        releaseDateLabel.text = releaseDate
        genresLabel.text = genres?.map( {($0.name ?? "")}).joined(separator: ",")
        playTimeLabel.text = String(playTime!)
        scoreLabel.text = String(score!)
        if score ?? 0 >= 75 {
            scoreLabel.layer.borderColor = UIColor.green.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.green
        } else if score ?? 0 >= 50 {
            scoreLabel.layer.borderColor = UIColor.yellow.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.yellow
        } else {
            scoreLabel.layer.borderColor = UIColor.red.cgColor
            scoreLabel.layer.borderWidth = 2.0
            scoreLabel.textColor = UIColor.red
        }

        self.cellIndex = index
        self.delegate = delegate
        self.isSaved = isSaved

        setSaveButtonColor(isSaved: isSaved)
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerViewTapped)))

    }

    @objc func containerViewTapped() {
        delegate?.didTappedBigCellGame(rowIndex: cellIndex)
    }

    @IBAction func saveButtonTapped() {
        bigCellSaveButton.isSelected = false
        isSaved.toggle()
        setSaveButtonColor(isSaved: isSaved)
        delegate?.didTappedBigCellSave(rowIndex: cellIndex, isSaved: isSaved)
    }


    func setSaveButtonColor(isSaved: Bool) {
        if isSaved == true {
            saveButtonContainerView.backgroundColor = .green
        } else {
            saveButtonContainerView.backgroundColor = .gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "BigCellCollectionViewCell", bundle: nil)
    }

}
