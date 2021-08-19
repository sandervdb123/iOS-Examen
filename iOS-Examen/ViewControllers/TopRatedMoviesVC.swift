//
//  TopRatedMoviesVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 19/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

final class TopRatedMovies: UITableViewController {
    var movieList = [Movie]() {
        didSet {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.TVregisterClassDefaultIdentifier(cellClass : MovieTableCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        configureTableView()
        fetchData()
        
        //setTableViewDelegates()
       
    }
    func configureTableView()  {
        
        tableView.layer.cornerRadius = 5
    }
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func fetchData() {
        APIManager.shared.fetch(MovieService.shared.getMoviesFromCategory(from: MovieListCategory.topRated)) { [weak self] res in
            switch res {
            case .success(let TMDBpage):
                DispatchQueue.main.async {
                    self?.movieList = TMDBpage.results
                }
            case .failure:
                DispatchQueue.main.async {
                  // TODO errors
                }
            }
        }
    }

}

// Delegates and DataSource extensions

extension TopRatedMovies {
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
        let viewController = MovieDetailsViewController(movie: movie)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

