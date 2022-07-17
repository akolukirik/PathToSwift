//
//  SampleProtocol.swift
//  SampleProtocol
//
//  Created by ali on 17.07.2022.
//

import Foundation
import UIKit

enum UserType {
    case ADMIN
    case USER
}

protocol SampleProtocol: UIViewController {
    var userType: UserType? { get }
    func changeUserTypeBackgroundColor()
}

extension SampleProtocol {
    
    var userType: UserType? {
        get { return .USER }
    }

    func changeUserTypeBackgroundColor() {
        view.backgroundColor = userType == .ADMIN ? .black : .red
    }
}
