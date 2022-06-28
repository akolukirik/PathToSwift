//
//  UIImageViewExtension.swift
//  ImageSliderTestApp
//
//  Created by ali on 28.06.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
