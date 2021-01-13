//
//  MoviesListVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class MoviesListVC: UIViewController {
    var movies = [Movie]() {
        didSet {
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setTableViewDelegates()

        // Do any additional setup after loading the view.
    }
    func configureTableView()  {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight=100
    }
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func fetchData() {
        APIManager.shared.execute(MovieService.shared.getMoviesFromCategory(from: MovieListCategory.popular)) { [weak self] result in
            switch result {
            case .success(let TMDBpage):
                DispatchQueue.main.async {
                    self?.movies = TMDBpage.results
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

extension MoviesListVC :  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableCell = tableView.TVdequeueReusableCellDefaultIdentifier()
        let movie = movies[indexPath.row]
        cell.configureMovieCell(movie)
        return cell
    }
    
    
}
