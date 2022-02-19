//
//  ViewController.swift
//  TravelBook
//
//  Created by ali on 19.02.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    }


}

