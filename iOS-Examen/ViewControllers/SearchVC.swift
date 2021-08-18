//
//  SearchVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 18/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDataSource {

    

        let tableView: UITableView = {
            let table = UITableView()
            table.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
            return table
        }()

        var models: [String] = Array(0...100).compactMap({ "\($0) item" })

        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(tableView)
            tableView.dataSource = self
            tableView.frame = view.bounds
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath)
            cell.textLabel?.text = models[indexPath.row]
            return cell
        }
    }

    class ViewController: UIViewController, UISearchResultsUpdating {

        let searchController = UISearchController(searchResultsController: SearchVC())

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Search"
            searchController.searchResultsUpdater = self
            navigationItem.searchController = searchController
        }

        func updateSearchResults(for searchController: UISearchController) {
            guard let text = searchController.searchBar.text else {
                return
            }
            let vc = searchController.searchResultsController as? SearchVC
            guard !text.isEmpty else {
                vc?.tableView.isHidden = true
                return
            }
            vc?.tableView.isHidden = false
            print(text)
        }
    }


