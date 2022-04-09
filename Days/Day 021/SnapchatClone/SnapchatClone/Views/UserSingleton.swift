//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by ali on 9.04.2022.
//

import Foundation

class UserSingleton {

    static let sharedUserInfo = UserSingleton()

    var email = ""
    var username = ""

    private init() {

    }
}
