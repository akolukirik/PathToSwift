//
//  CustomView.swift
//  GamingApp
//
//  Created by ali on 19.06.2022.
//

import UIKit

@IBDesignable
final class CustomView: UIView {

    @IBOutlet private var titleLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }

    private func configureView() {
        guard let view = self.loadViewFromNib(niBName: "CustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }

    func configureView(title: String) {
        self.titleLabel.text = title
    }

}

