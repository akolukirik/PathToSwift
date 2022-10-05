//
//  Model.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import Foundation

// MARK: - Welcome
struct CharactersResponseModel: Decodable {
    let results: [CharacterResponse]?
}

// MARK: - CharacterResponse
struct CharacterResponse: Decodable {
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