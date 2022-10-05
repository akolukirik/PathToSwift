//
//  UIStoryboard+Ext.swift
//  RickAndMortyViper
//
//  Created by İsmail Kılıç on 28.09.2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        return UIStoryboard(name: T.storyboardName(),
                            bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }

    static func loadViewController<T>(storyboardName: String, identifier: String) -> T where T: UIViewController {
        return UIStoryboard(name: storyboardName,
                            bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
}
