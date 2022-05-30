//
//  DetailsModel.swift
//  F1Pilots
//
//  Created by ali on 29.05.2022.
//

import Foundation

//typealias PilotDetailList = [PilotDetail]

struct PilotDetail: Codable {
    var id, age: Int?
    var image: String?
    var team: String?
}
