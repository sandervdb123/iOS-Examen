
//
//  MovieTableCell.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {

    var covImage = UIImageView()
    var movLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
        configureTitleLabel()
        setcoverImageConstraints()
        setTitleLabelConstraints()
        
        addSubview(movLabel)
        addSubview(covImage)

        
        
    }
    func setCell(movie : Movie){
        covImage.setImageCover(poster: movie.posterPath)
        movLabel.text = movie.title
    }
    /*func configureMovieCell(_ movie: Movie) {
        movLabel.text = movie.title
        covImage.setImageCover(poster: movie.posterPath)
    }*/
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureImageView(){
        covImage.layer.cornerRadius = 8
        covImage.clipsToBounds = true
        
    }
    func configureTitleLabel(){
        movLabel.numberOfLines = 1
        movLabel.adjustsFontSizeToFitWidth = true
        
    }
    func setTitleLabelConstraints() {
        movLabel.translatesAutoresizingMaskIntoConstraints = false
        movLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant : 12).isActive = true
        movLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        movLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant : -10).isActive = true
    }
    func setcoverImageConstraints() {
        covImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        covImage.leadingAnchor.constraint(equalTo: covImage.trailingAnchor,constant : 20).isActive = true
        covImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        covImage.widthAnchor.constraint(equalTo: covImage.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    

    
}
