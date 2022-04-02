//
//  MusicianStruct.swift
//  AdvancedSwiftProject
//
//  Created by ali on 2.04.2022.
//

import Foundation

struct MusicianStruct {

    var name : String
    var age : Int
    var instrument : String

    mutating func happyBirthday() {
        self.age += 1
    }
    
}
