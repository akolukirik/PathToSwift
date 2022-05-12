//
//  Network.swift
//  Earthquake
//
//  Created by ali on 12.05.2022.
//

import Foundation

struct Earthquake: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let timestamp: String?
    let latitude, longitude, depth, size: Double?
    let quality: Double?
    let humanReadableLocation: String?
}
