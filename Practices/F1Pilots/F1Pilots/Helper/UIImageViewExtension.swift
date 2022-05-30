//
//  UIImageViewExtension.swift
//  F1Pilots
//
//  Created by ali on 30.05.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {

    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
