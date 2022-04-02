//
//  MusicianClass.swift
//  AdvancedSwiftProject
//
//  Created by ali on 2.04.2022.
//

import Foundation

class MusicianClass {

    var name : String
    var age : Int
    var instrument : String

    init(nameInput : String, ageInput : Int, instrumentInput : String) {
        self.name = nameInput
        self.age = ageInput
        self.instrument = instrumentInput
    }

    func happyBirthday() {
        self.age += 1
    }
}
