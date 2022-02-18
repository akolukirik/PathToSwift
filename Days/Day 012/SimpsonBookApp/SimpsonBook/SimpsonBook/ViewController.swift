//
//  ViewController.swift
//  SimpsonBook
//
//  Created by ali on 18.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mySimspsons = [Simpson]()
    var choosenSimpson : Simpson?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(simpsonName: "homer", simpsonJob: "nucleer safety", simpsonImage: UIImage(named: "b")!)
        let marge = Simpson(simpsonName: "marge", simpsonJob: "housewife", simpsonImage: UIImage(named: "a")!)
        let bart = Simpson(simpsonName: "bart", simpsonJob: "student", simpsonImage: UIImage(named: "c")!)
        
        mySimspsons.append(homer)
        mySimspsons.append(marge)
        mySimspsons.append(bart)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimspsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         choosenSimpson = mySimspsons[indexPath.row]
        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let destinationVc = segue.destination as! SecongViewController
            destinationVc.selected = choosenSimpson
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimspsons.count
    }
}

