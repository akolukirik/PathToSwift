//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by ali on 2.04.2022.
//

import Foundation

let classJames = MusicianClass(nameInput: "james", ageInput: 50, instrumentInput: "guitar")
//print(classJames.age)

var structJames = MusicianStruct(name: "james", age: 50, instrument: "guitar")
//print(structJames.age)

classJames.age = 51
//print(classJames.age)

structJames.age = 51
//print(structJames.age)

let copyOfClassJames = classJames
var copyOfStructJames = structJames

//print(copyOfClassJames.age)
//print(copyOfStructJames.age)

copyOfClassJames.age = 52
copyOfStructJames.age = 52
/*
print(copyOfClassJames.age)
print(copyOfStructJames.age)

print(classJames.age)
print(structJames.age)
*/

//print(classJames.age)
classJames.happyBirthday()
//print(classJames.age)

print(structJames.age)
structJames.happyBirthday()
print(structJames.age)

let myTuple = (1,2)
print(myTuple.0)

var myTuple2 = (1,2,3)
myTuple2.2 = 20
print(myTuple2.2)

