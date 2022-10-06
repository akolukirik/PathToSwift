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
    func setTitleLabelText(_ text: Int)
}

class CharacterDetailPageViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    @IBOutlet var titleLabel: UILabel!

    var presenter: ICharacterDetailPagePresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension CharacterDetailPageViewController: ICharacterDetailPageViewController {
    func setTitleLabelText(_ text: Int) {
        titleLabel.text = String(text)
    }
}
