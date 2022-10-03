//
//  SimpleEndPointRouter.swift
//  NetworkExample
//
//  Created by İsmail Kılıç on 3.10.2022.
//

import Alamofire
import Foundation

extension SimpleEndPointRouter {
    private enum Constants {

        enum BaseUrl {
            static let baseUrl = "https://rickandmortyapi.com/api"
        }

        enum Headers {
            static let versionHeader: HTTPHeader = .init(name: "Version", value: "5.1.7")
            static let oSVersionHeader: HTTPHeader = .init(name: "OSVersion", value: "11.3.1")
            static let buildHeader: HTTPHeader = .init(name: "Build", value: "216")
            static let genderHeader: HTTPHeader = .init(name: "Gender", value: "F")
            static let platformHeader: HTTPHeader = .init(name: "Platform", value: "iphone")
        }
    }
}

enum SimpleEndPointRouter: BaseEndPointRouter {
    case characters
    case characterDetail(id: Int)
    case filterCharacter(name: String, status: CharacterStatus)
    case test

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .characters:
            return .get
        case .characterDetail:
            return .get
        default:
            return .post
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .characters: return "/character"
        case .characterDetail(let id): return "/character/\(id)"
        case .filterCharacter: return "/character/"
        default: return ""
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        switch self {
        case .characters, .characterDetail, .filterCharacter:
            return Constants.BaseUrl.baseUrl
        default:
            return ""
        }
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        if self.method == HTTPMethod.get {
            return URLEncoding()
        } else {
            return JSONEncoding()
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .filterCharacter(let name, let status):
            return ["name": name,
                    "status": status.rawValue]
        default:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Headers
        let jsonHeader = "application/json"
        urlRequest.headers.add(.accept(jsonHeader))
        urlRequest.headers.add(.contentType(jsonHeader))

//        urlRequest.headers.add(Constants.genderHeader)
//        urlRequest.headers.add(Constants.versionHeader)
//        urlRequest.headers.add(Constants.oSVersionHeader)
//        urlRequest.headers.add(Constants.buildHeader)
//        urlRequest.headers.add(Constants.platformHeader)


        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }

        return urlRequest
    }

    private func queryString(_ value: String, params: Parameters) -> URL? {
        var components = URLComponents(string: value)
        components?.queryItems = params.map { element in
            URLQueryItem(name: element.key,
                                    value: element.value as? String)
        }

        return components?.url
    }
}
