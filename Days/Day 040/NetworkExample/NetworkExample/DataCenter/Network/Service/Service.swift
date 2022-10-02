//
//  Service.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func fetchCharacters(onSuccess: @escaping (CharacterResponse?) -> Void, onError: @escaping (AFError) -> Void)
    func getCharacterDetail(characterID: Int, onSuccess: @escaping (CharacterDetailResonse?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Service
final class Service: ServiceProtocol {

    func fetchCharacters(onSuccess: @escaping (CharacterResponse?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.CharacterServiceEndPoint.fetchCharacter()) { (response: CharacterResponse) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }

    func getCharacterDetail(characterID: Int, onSuccess: @escaping (CharacterDetailResonse?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.NetworkConstant.CharacterServiceEndPoint.fetchCharacterDetail(characterID: characterID)) { (response: CharacterDetailResonse) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
