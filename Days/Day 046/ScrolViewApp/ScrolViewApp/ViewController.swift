//
//  ViewController.swift
//  ScrolViewApp
//
//  Created by ali on 12/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabel()
        descriptionLabel.numberOfLines = 4
        let tapToDescription = UITapGestureRecognizer(target: self, action: #selector(descriptionTapped))
        descriptionView.addGestureRecognizer(tapToDescription)
    }
    
    @objc func descriptionTapped() {
        if let descriptionLabel = descriptionLabel {
            descriptionLabel.numberOfLines = descriptionLabel.numberOfLines == 0 ? 4 : 0
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.allowAnimatedContent],
                           animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
       }
    }
}

extension ViewController {
    func prepareLabel() {
        descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    }
}
