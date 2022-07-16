//
//  JsonPlaceHolderViewController.swift
//  CleanTableView
//
//  Created by ali on 16.07.2022.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {

    @IBOutlet var tableViewJsonPlaceHolder: UITableView!

    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPLaceHolderProtocol = JsonPlaceHolderService()

    override func viewDidLoad() {
        super.viewDidLoad()
        initService()
        initDelegate()
    }

    private func initDelegate() {
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        tableViewJsonPlaceHolder.delegate = jsonTableView
        jsonTableView.delegate = self
    }

    private func initService() {
        jsonService.fethAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
        } onFail: { (data) in
            print( data ?? "" )
        }
    }

}

extension JsonPlaceHolderViewController: JsonTableViewOutput {
    func onSelected(item: PostModel) {
        print(item.body ?? "")
    }

}
