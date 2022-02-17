//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by ali on 18.02.2022.
//

import Foundation

class SuperMusician : Musicians {
    
    func sing2() {
        print("enter night")
    }
    
    override func sing() {
        super.sing()
        print("exit light")
    }
    
}
