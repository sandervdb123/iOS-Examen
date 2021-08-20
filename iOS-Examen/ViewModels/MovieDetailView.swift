//
//  MovieDetailView.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 14/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation
import UIKit



final class MovieDetailView: UIView {
    
    let scView = UIScrollView()
    let backImage = UIImageView()
    let movTitle = UILabel()
    let overview = UILabel()
    let relatedmovies = UILabel()
    lazy var sv = UIStackView(arrangedSubviews: [movTitle, overview, relatedmovies])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configDetails()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configDetails()
    }
    
    private func configDetails() {
        backgroundColor = .black
        
        backImage.contentMode = .scaleAspectFill
        relatedmovies.font = UIFont.preferredFont(forTextStyle: .title2)
        
        movTitle.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        movTitle.textColor = .white
        movTitle.numberOfLines = 5
        
        relatedmovies.font = UIFont.preferredFont(forTextStyle: .title3)
        relatedmovies.textColor = .white
        relatedmovies.numberOfLines = 0
        
        overview.font = UIFont.preferredFont(forTextStyle: .body)
        overview.textColor = .white
        overview.numberOfLines = 0
        
        sv.axis = .vertical
        sv.spacing = 50
        addSubview(scView)
        scView.addSubview(backImage)
        scView.addSubview(sv)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scView.translatesAutoresizingMaskIntoConstraints = false
        backImage.translatesAutoresizingMaskIntoConstraints = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scView.topAnchor.constraint(equalTo: topAnchor),
            scView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backImage.topAnchor.constraint(equalTo: scView.topAnchor),
            backImage.leadingAnchor.constraint(equalTo: scView.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: scView.trailingAnchor),
            backImage.centerXAnchor.constraint(equalTo: scView.centerXAnchor),
            backImage.heightAnchor.constraint(equalTo: backImage.widthAnchor, multiplier: 9 / 16, constant: 0),
            
            movTitle.bottomAnchor.constraint(equalTo: backImage.bottomAnchor, constant: -12),
            
            sv.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            sv.bottomAnchor.constraint(equalTo: scView.bottomAnchor)
            ]
        )
        layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
    }
    
    func setDetails(movieDetail: MovieDetail) {
        backImage.setImageBackdrop(backdrop: movieDetail.backdropPath)
        
        movTitle.text = movieDetail.title
        
        relatedmovies.text = "RELATED MOVIES"
        relatedmovies.textAlignment = .center
        
        //todo ratings vote average popularity
        
        overview.text = movieDetail.overview
    }
}

