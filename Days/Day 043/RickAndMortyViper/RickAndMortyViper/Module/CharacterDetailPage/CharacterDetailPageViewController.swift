//
//  CharacterDetailPageViewController.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation
import UIKit

protocol ICharacterDetailPageViewController: IBaseView {
    func setTitleLabelText(_ text: String, image: String)
}

class CharacterDetailPageViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!

    var presenter: ICharacterDetailPagePresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CharacterDetailPageViewController: ICharacterDetailPageViewController {
    func setTitleLabelText(_ text: String, image: String) {
        titleLabel.text = String(text)
        characterImageView.setImage(imageURL: image)
    }
}
