//
//  DetailPageViewController.swift
//  F1PilotsViper
//
//  Created by ali on 2.08.2022.
//  
//

import Foundation
import UIKit

protocol IDetailPageViewController: IBaseView {
    func setTitleLabelText(_ text: String)
}

class DetailPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet var titleLabel: UILabel!
    // MARK: Properties

    var presenter: IDetailPagePresenter?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailPageViewController: IDetailPageViewController {
    func setTitleLabelText(_ text: String) {
        titleLabel.text = text
    }
}
