//
//  ViewController.swift
//  Calculator
//
//  Created by ali on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var textSonuc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func topla(_ sender: Any) {
        
        if let sayi1 = Int(text1.text!) {
            if let sayi2 = Int(text2.text!) {
                
                let sonuc = sayi1 + sayi2
                
                textSonuc.text = String(sonuc)
            }
        }
        
    }
    
    @IBAction func cikar(_ sender: Any) {
        if let sayi1 = Int(text1.text!) {
            if let sayi2 = Int(text2.text!) {
                
                let sonuc = sayi1 - sayi2
                
                textSonuc.text = String(sonuc)
            }
        }
    }
    
    
    @IBAction func carp(_ sender: Any) {
        if let sayi1 = Int(text1.text!) {
            if let sayi2 = Int(text2.text!) {
                
                let sonuc = sayi1 * sayi2
                
                textSonuc.text = String(sonuc)
            }
        }
    }
    
    @IBAction func bol(_ sender: Any) {
        if let sayi1 = Int(text1.text!) {
            if let sayi2 = Int(text2.text!) {
                
                let sonuc = sayi1 / sayi2
                
                textSonuc.text = String(sonuc)
            }
        }
    }
    
    
    
}
