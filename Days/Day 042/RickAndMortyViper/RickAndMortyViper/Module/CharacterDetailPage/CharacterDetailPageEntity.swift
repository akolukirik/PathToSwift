//
//  CharacterDetailPageEntity.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//

import Foundation

struct CharacterDetailResponse: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
