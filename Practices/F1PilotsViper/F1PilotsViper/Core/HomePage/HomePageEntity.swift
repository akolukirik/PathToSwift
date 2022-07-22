//
//  HomePageEntity.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//

import Foundation

struct PilotModel: Codable {
    var items: [PilotResult]?
}

struct PilotResult: Codable {
    var id: Int?
    var name: String?
    var point: Int?
}
