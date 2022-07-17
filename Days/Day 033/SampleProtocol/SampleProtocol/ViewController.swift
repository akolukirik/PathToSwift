//
//  ViewController.swift
//  SampleProtocol
//
//  Created by ali on 17.07.2022.
//

import UIKit

class ViewController: UIViewController, SampleProtocol {

    var userType: UserType? {
        get { return .ADMIN }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        changeUserTypeBackgroundColor()
    }

}
