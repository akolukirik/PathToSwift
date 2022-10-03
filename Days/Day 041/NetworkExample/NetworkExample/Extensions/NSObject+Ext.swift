//
//  NSObject+Ext.swift
//  NetworkExample
//
//  Created by İsmail Kılıç on 3.10.2022.
//


import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
