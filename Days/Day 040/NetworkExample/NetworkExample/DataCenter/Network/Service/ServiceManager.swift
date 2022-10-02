//
//  ServiceManager.swift
//  NetworkExample
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import Foundation
import Alamofire

final class ServiceManager {
    public static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    func fetch<T>(path: String, onSuccess: @escaping (T) -> Void,
                  onError: @escaping (AFError) -> Void) where T: Decodable {
        AF.request(path,
                   encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else {
                return
            }
            onSuccess(model)
        }
    }
}
