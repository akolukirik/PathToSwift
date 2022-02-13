//
//  ViewController.swift
//  SegueApp
//
//  Created by ali on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstLabel: UIView!
    @IBOutlet weak var mainText: UITextField!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad function called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWilDisappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        mainText.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }
    
    
    @IBAction func nextClick(_ sender: Any) {
        
        userName = mainText.text ?? ""
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let destinationVc = segue.destination as! SecondViewController
            destinationVc.name = userName
            
        }
    }
    
}
