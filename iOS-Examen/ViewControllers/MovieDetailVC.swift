//
//  MovieDetailVC.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 14/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//
import UIKit

final class MovieDetailVC: UIViewController {
    let movie: Movie
    var movieDetails: MovieDetail?
    var relatedMovies : RelatedMovieList?
    var currentVC: UIViewController!
    var UIcollView: UICollectionView!

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let loadVC = LoadVC()
        addChild(loadVC)
        loadVC.view.frame = view.bounds
        loadVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(loadVC.view)
        loadVC.didMove(toParent: self)
        currentVC = loadVC
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataMovieDetail()
        
        let collViewLayout = UICollectionViewFlowLayout()
        collViewLayout.scrollDirection = .horizontal
        
        // TODO extract collectionview
        let collViewInst = UICollectionView(frame: .zero, collectionViewLayout: collViewLayout)
        
        collViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collViewInst)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collViewInst.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collViewInst.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collViewInst.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collViewInst.trailingAnchor),
            
        ])
        self.UIcollView = collViewInst
        self.UIcollView.dataSource = self
        self.UIcollView.delegate = self
        self.UIcollView.register(CollectionCell.self, forCellWithReuseIdentifier: "Cell")
        self.UIcollView.alwaysBounceVertical = true
        self.UIcollView.backgroundColor = .black
        self.UIcollView.showsHorizontalScrollIndicator = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchDataForRelatedMovies()
    }
    
    @objc func fetchDataForRelatedMovies() {
        APIManager.shared.fetch(MovieService.shared.getRelatedMovies(for: movie)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let relatedMovies):
                DispatchQueue.main.async {
                    self.relatedMovies = relatedMovies
                    self.UIcollView.reloadData()
                }
            case .failure:
                DispatchQueue.main.async {
                   
                }
            }
        }
    }
    
    @objc func fetchDataMovieDetail() {
        APIManager.shared.fetch(MovieService.shared.getMovieDetails(for: movie)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self.showMovieDetails(movieDetails)
                }
            case .failure:
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    
    func showMovieDetails(_ movieDetails: MovieDetail) {
        let displayViewController = setMovieDetailsVC(movieDetail: movieDetails)
        addChild(displayViewController)
        displayViewController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 550)
        displayViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        currentVC.willMove(toParent: nil)
        transition(
            from: currentVC,
            to: displayViewController,
            duration: 0.25,
            options: [.transitionCrossDissolve],
            animations: nil
        ) { (_) in
            self.currentVC.removeFromParent()
            self.currentVC = displayViewController
            self.currentVC.didMove(toParent: self)
        }
    }
}

class CollectionCell: UICollectionViewCell {
    var imageViewRelMovie: UIImageView = {
       let relatedMovieImage = UIImageView()
        relatedMovieImage.contentMode = .scaleAspectFill
        relatedMovieImage.isUserInteractionEnabled = true
        return relatedMovieImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CollectionCell {
    fileprivate func setup() {
        imageViewRelMovie.frame = CGRect(x: 0, y: 350, width: 100, height: 200)
        self.addSubview(imageViewRelMovie)
    }
}

extension MovieDetailVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.relatedMovies?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.imageViewRelMovie.setImageCover(poster: self.relatedMovies?.results[indexPath.row].posterPath ?? "")
        return cell
    }
}

extension MovieDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 190)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = 0.0
    }
    
    private class setMovieDetailsVC: UIViewController {
    let movieDetail: MovieDetail
    
    init(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MovieDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (view as? MovieDetailView)?.setDetails(movieDetail: movieDetail)
    }
    }
}



