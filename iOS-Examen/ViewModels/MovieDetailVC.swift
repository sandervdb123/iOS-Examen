//
//  MovieDetailVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 14/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//
import UIKit

import Foundation
final class MovieDetailVC: UIViewController {
    
    var movie : Movie
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    @objc func fetchData() {
        APIManager.shared.fetch(MovieService.shared.getMovieDetails(for: movie)) { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.showMovieDetails(movieDetail)
                }
            case .failure:
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    func showMovieDetails(_ movieDetail: MovieDetail) {
        //
    }
}



