//
//  DetailPageViewController.swift
//  F1PilotsViper
//
//  Created by ali on 23.07.2022.
//

import UIKit

protocol IDetailView {
    var detailPresenter: IDetailPresenter? { get set }
    func detailUpdate(with pilotsDetail: [PilotDetail])
}
class DetailPageViewController: UIViewController, IDetailView {



    var detailPresenter: IDetailPresenter?

    @IBOutlet var navigationView: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        navigationView.topItem?.leftBarButtonItem = button
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }

    func detailUpdate(with pilotsDetail: [PilotDetail]) {
        print(pilotsDetail.count ?? 0)
    }

}
