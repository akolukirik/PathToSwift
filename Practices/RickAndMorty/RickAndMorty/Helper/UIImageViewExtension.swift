//
//  UIImageViewExtension.swift
//  RickAndMorty
//
//  Created by ali on 16.05.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {

    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
