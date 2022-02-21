//
//  DetailViewController.swift
//  ArtBookApp
//
//  Created by ali on 21.02.2022.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let tapGestureRegognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(tapGestureRegognizer)
    
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        print("test")
    }
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
    }
    
    @objc func selectImage() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        //picker.sourceType = .camera
        //picker.sourceType = .savedPhotosAlbum
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true //fotoğrafa müdehale edebilmek için
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage]  as? UIImage        //info içerisine bir çok farklı fonskiyon çıkıyor bunları incele
        self.dismiss(animated: true, completion: nil)
    }
        
}
