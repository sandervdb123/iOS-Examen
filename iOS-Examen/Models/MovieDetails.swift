//
//  MovieDetails.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

struct MovieDetails: Decodable {
    
    let title: String
    let overview: String
    let backdropPath: String
    let tagline: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case backdropPath = "backdrop_path"
        case tagline
    }
    
}
