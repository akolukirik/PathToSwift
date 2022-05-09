//
//  Network.swift
//  F1Pilots
//
//  Created by ali on 9.05.2022.
//

import Foundation

struct DataBase: Codable {
    var driverDetail: [DriverDetail]?
}

struct DriverDetail: Codable {
    var id, age: Int?
    var image: String?
    var team: String?
}

struct Drivers: Codable {
    var items: [PilotDetail]?
}

struct PilotDetail: Codable {
    var id: Int?
    var name: String?
    var point: Int?
}
