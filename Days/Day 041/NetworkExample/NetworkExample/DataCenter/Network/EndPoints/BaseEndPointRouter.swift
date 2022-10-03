//
//  BaseEndPointRouter.swift
//  NetworkExample
//
//  Created by İsmail Kılıç on 3.10.2022.
//

import Alamofire
import Foundation

public protocol BaseEndPointRouter: URLRequestConvertible {
    /// Returns a `URLRequest` or throws if an `Error` was encountered.
    ///
    /// - Returns: A `URLRequest`.
    /// - Throws:  Any error thrown while constructing the `URLRequest`.
    func asURLRequest() throws -> URLRequest
}
