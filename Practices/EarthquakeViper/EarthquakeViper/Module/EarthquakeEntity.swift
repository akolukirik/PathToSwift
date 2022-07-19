//
//  EarthquakeEntity.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import Foundation

// modelin oldugu kısım

struct EarthquakeModel: Codable {
    let results: [EarthquakeResult]?
}

struct EarthquakeResult: Codable {
    let timestamp: String?
    let latitude, longitude, depth, size: Double?
    let quality: Double?
    let humanReadableLocation: String?
}
