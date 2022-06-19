//
//  ViewController.swift
//  ReusableView
//
//  Created by ali on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstCustomView: CustomView!
    @IBOutlet var secondCustomView: CustomView!
    @IBOutlet var thirdCustomView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstCustomView.configureView(title: "First")
        secondCustomView.configureView(title: "Second2222222222222222")
    }


}

