//
//  HomepageEntity.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import Foundation

struct CharactersResponseModel: Decodable {
    let results: [Character]?
}

// MARK: - Result
struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: CharacterStatus?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Decodable {
    let name: String?
    let url: String?
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum CharacterStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
