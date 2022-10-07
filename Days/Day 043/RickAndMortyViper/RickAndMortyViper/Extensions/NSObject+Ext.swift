//
//  NSObject+Ext.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
