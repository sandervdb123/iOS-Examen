//
//  SearchVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 18/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class SearchResVC: UITableViewController {
    
    var movieList = [Movie]() {
        didSet {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.TVregisterClassDefaultIdentifier(cellClass: MovieTableCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        
        NotificationCenter.default.addObserver(self, selector: #selector(textSizeChanged), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func textSizeChanged() {
        tableView.reloadData()
    }
}

extension SearchResVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableCell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.tvc_defaultIdentifier) as! MovieTableCell
        let movie = movieList[indexPath.row]
        cell.setCell(movie)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        let viewController = MovieDetailVC(movie: movie)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
    class SearchResUpdating: UITableViewController, UISearchResultsUpdating {

        let searchResController = UISearchController(searchResultsController: SearchResVC())

        override func viewDidLoad() {
            super.viewDidLoad()
            searchResController.searchResultsUpdater = self
            navigationItem.searchController = searchResController
        }

        func updateSearchResults(for sResController: UISearchController) {
            let request = HttpRequest<TMDBPage<Movie>>(method: Method.get, path: "/search/movie", pars: ["query": sResController.searchBar.text!])
            APIManager.shared.fetch(request, completion: { result in
                if case .success(let page) = result {
                    DispatchQueue.main.async {
                        (sResController.searchResultsController as! SearchResVC).movieList = page.results
                    }
                }
            })
        }
    }


