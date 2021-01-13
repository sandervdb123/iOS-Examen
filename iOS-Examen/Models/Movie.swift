//
//  Movie.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 12/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
}
