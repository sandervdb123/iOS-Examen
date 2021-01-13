//
//  TMDBPage.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation
struct TMDBPage<T: Decodable>: Decodable {
    
    let pageNumber: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
}
