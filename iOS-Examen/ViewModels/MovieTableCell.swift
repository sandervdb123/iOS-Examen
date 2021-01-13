
//
//  MovieTableCell.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {

    var coverImage = UIImageView()
    var movieTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        configureTitleLabel()
        setcoverImageConstraints()
        setTitleLabelConstraints()
        
        addSubview(movieTitleLabel)
        addSubview(coverImage)

        
        
    }
    func configureMovieCell(_ movie: Movie) {
        movieTitleLabel.text = movie.title
        coverImage.setImageCover(poster: movie.posterPath)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureImageView(){
        coverImage.layer.cornerRadius = 8
        coverImage.clipsToBounds = true
        
    }
    func configureTitleLabel(){
        movieTitleLabel.numberOfLines = 1
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = true
    }
    func setcoverImageConstraints() {
        coverImage.translatesAutoresizingMaskIntoConstraints = true
    }
    
    

    
}
