//
//  main.swift
//  MusicianClass
//
//  Created by ali on 17.02.2022.
//

import Foundation

let james = Musicians(nameInit: "James", ageInit: 15, instrumentInit: "Guitar", typeInit: .Vocalist)

/*
print(james.name)
print(james.instrument)
print(james.type)
james.sing()
 */

let kirk = SuperMusician(nameInit: "Kirk", ageInit: 17, instrumentInit: "Guitar", typeInit: .LeadGuitar)
kirk.sing()
//kirk.sing2()
