
//
//  MovieTableCell.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import UIKit

final class MovieTableCell: UITableViewCell {
    let covImage = UIImageView()
    let movTitle = UILabel()
    let overview = UILabel()
    let svHead = UIStackView()
    let sv = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configCell()
    }
    private func configCell() {
        movTitle.numberOfLines = 3
        movTitle.textColor = .black
        movTitle.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        movTitle.textAlignment = .center
        
        overview.textColor = .gray
        overview.numberOfLines = 5
        covImage.contentMode = .scaleAspectFit
        
        svHead.spacing = 5
        svHead.alignment = .top
        sv.axis = .vertical
        sv.spacing = 10
        svHead.addArrangedSubview(covImage)
        svHead.addArrangedSubview(movTitle)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.addArrangedSubview(svHead)
        sv.addArrangedSubview(overview)
        contentView.addSubview(sv)
        setupConstraints()

    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            sv.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 8),
            sv.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -8),
            covImage.widthAnchor.constraint(equalToConstant: 180),
            covImage.heightAnchor.constraint(equalToConstant: 320)
            ])
    }
    func setCell(_ movie: Movie) {
        movTitle.text = movie.title
        overview.text = movie.overview
        covImage.setImageCover(poster: movie.posterPath)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
