//
//  RelatedMovie.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 19/08/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

struct RelatedMovieList: Decodable {
    
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

