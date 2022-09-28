//
//  NSObject+Ext.swift
//  RickAndMortyViper
//
//  Created by İsmail Kılıç on 28.09.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
