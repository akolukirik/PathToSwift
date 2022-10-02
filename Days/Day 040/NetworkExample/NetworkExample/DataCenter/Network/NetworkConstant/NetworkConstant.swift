//
//  NetworkConstant.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import Foundation

extension Constant {
    class NetworkConstant{

        enum CharacterServiceEndPoint: String {

        case BASE_URL = "https://rickandmortyapi.com/api/character"
        //case API_KEY = ""

            static func fetchCharacter() -> String {
                "\(BASE_URL.rawValue)"
            }

            static func fetchCharacterDetail(characterID: Int) -> String {
                "\(BASE_URL.rawValue)/\(characterID)"
            }

        }
    }
}
