//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by ali on 3.04.2022.
//

import Foundation
import SwiftUI

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]

}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var description : String
}

let metallica = FavoriteElements(name: "Metallica", imageName: "metallica", description: "10 numara adamlar")
let gunsAndRoses = FavoriteElements(name: "Guns and Roses", imageName: "guns", description: "11 numara adamlar")
let slipknot = FavoriteElements(name: "Slipknot", imageName: "slipknot", description: "12 numara adamlar")
let linkInPark = FavoriteElements(name: "Link in Park", imageName: "linkinpark", description: "13 numara adamlar")

let favoriteBands = FavoriteModel(title: "Favorite Bands", elements: [metallica,gunsAndRoses,slipknot,linkInPark])

let lotr = FavoriteElements(name: "Lord of the Rings", imageName: "lotr", description: "iyi film")
let matrix = FavoriteElements(name: "Matrix", imageName: "matrix", description: "güzel film")
let gora = FavoriteElements(name: "G.O.R.A.", imageName: "gora", description: "komik film")
let leon = FavoriteElements(name: "Leon", imageName: "leon", description: "film")

let favoriteMovies = FavoriteModel(title: "Favorite Movies", elements: [lotr,matrix,gora,leon])

let myFavorites = [favoriteBands,favoriteMovies]

