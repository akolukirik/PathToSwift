//
//  UIViewExtension.swift
//  GamingApp
//
//  Created by ali on 19.06.2022.
//

import Foundation
import UIKit

extension UIView {
    func loadViewFromNib(niBName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: niBName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
