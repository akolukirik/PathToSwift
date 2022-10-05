//
//  Service.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    func fetchCharacters(onSuccess: @escaping (CharactersResponseModel?) -> Void, onError: @escaping (AFError) -> Void)
    func getCharacterDetail(characterID: Int, onSuccess: @escaping (CharacterDetailResonse?) -> Void, onError: @escaping (AFError) -> Void)
}

//MARK: - Service
final class Service: ServiceProtocol {

    func fetchCharacters(onSuccess: @escaping (CharactersResponseModel?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.characters) { (response: CharactersResponseModel?) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }

    func getCharacterDetail(characterID: Int, onSuccess: @escaping (CharacterDetailResonse?) -> Void, onError: @escaping (AFError) -> Void) {

        ServiceManager.shared.performRequest(endpoint: SimpleEndPointRouter.characterDetail(id: characterID)) { (response: CharacterDetailResonse?) in
            onSuccess(response)
        } onError: { AFError in
            print(AFError)
            print(555)
        }
    }

}
