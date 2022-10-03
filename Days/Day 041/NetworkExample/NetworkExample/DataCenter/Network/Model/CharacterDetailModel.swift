//
//  CharacterDetailModel.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 2.10.2022.
//

import Foundation

// MARK: - Welcome
struct CharacterDetailResonse: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
