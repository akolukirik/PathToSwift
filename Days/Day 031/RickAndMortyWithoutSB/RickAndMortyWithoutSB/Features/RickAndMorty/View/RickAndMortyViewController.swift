//
//  RickAndMortyViewController.swift
//  RickAndMortyWithoutSB
//
//  Created by ali on 9.07.2022.
//

import UIKit
import SnapKit

final class RickAndMortyViewController: UIViewController {

    private let labelTitle: UILabel = UILabel()
    private let box: UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        drawDesign()
        makeBox()
        makeLabel()
        makeIndicator()

    }

    private func drawDesign() {

        DispatchQueue.main.async {
            self.box.backgroundColor = .red
            self.view.backgroundColor = .white
            self.labelTitle.text = "Test"
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
}


extension RickAndMortyViewController {

    private func makeBox() {

        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    private func makeLabel() {

        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    private func makeIndicator() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
