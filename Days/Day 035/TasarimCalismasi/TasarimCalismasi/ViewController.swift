//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by ali on 9.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pizza"

        let apperance = UINavigationBarAppearance()

        apperance.backgroundColor = UIColor(named: "anaRenk")
        apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,
                                         NSAttributedString.Key.font: UIFont(name: "Pacifico-Regular",size: 22) as Any] //font yüklemesi sonrası target membersip kısmına diggaded..

        navigationController?.navigationBar.isTranslucent = true //renk doğruluğu için tatlı güzel bir detay **
        navigationController?.navigationBar.barStyle = .black // saat,pil gibi yukarı kısımda bulunan objerin rengini değiştirmek için
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
    }


}

