//
//  Network.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import Foundation

struct PilotData: Codable {
    var items: [Pilot]?
}

struct Pilot: Codable {
    var id: Int?
    var name: String?
    var point: Int?
}
