//
//  Animals.swift
//  AnimalsWidged
//
//  Created by ali on 15.04.2022.
//

import Foundation

struct Animals : Identifiable, Codable  {
    let image : String
    let name : String
    var id : String{image}
}

let rhino = Animals(image: "rhino", name: "Rhino")
let shark = Animals(image: "shark", name: "Shark")
let squid = Animals(image: "squid", name: "Squid")
