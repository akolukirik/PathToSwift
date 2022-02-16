//
//  ViewController.swift
//  LandmarkBook
//
//  Created by ali on 16.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String()]
    var landmarkImages = [UIImage()]
    var chosenLandmarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("colosseum")
        landmarkNames.append("anitkabir")
        landmarkNames.append("pisa  tower")
        landmarkNames.append("taj mahal")
        
        //optional ?????
        landmarkImages.append(UIImage(named: "col.jpg")!)
        landmarkImages.append(UIImage(named: "anit.jpg")!)
        landmarkImages.append(UIImage(named: "pisa.jpg")!)
        landmarkImages.append(UIImage(named: "taj.jpg")!)
        
        navigationItem.title = "Landmark Book"
               
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandMarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    //segue işlemi olmadan önce
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toImageViewController" {
            
            let destinationVC = segue.destination as! ImageViewController
            
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandMarkImage
            
        }
    }
}

