//
//  SimilarMovies.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

struct SimilarMovies: Decodable {
    
    let results: [Results]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
}

struct Results: Decodable {
    let id: Int
    let original_title: String
    let overview: String
    let backdrop_path: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case original_title
        case overview
        case backdrop_path = "poster_path"
    }
}
