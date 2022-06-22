//
//  UIImageViewExtension.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
