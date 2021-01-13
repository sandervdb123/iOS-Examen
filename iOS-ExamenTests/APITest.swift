//
//  APITest.swift
//  iOS-ExamenTests
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import XCTest
final class APITest: XCTest {

    func test_getMoviesFromCategory() {
        
        let popular_movies_request = HttpRequest<TMDBPage<Movie>>(MovieService.shared.getMoviesFromCategory(from : Category.popular))
        
        let request_url = URL(APIManager.shared.host, APIManager.shared.apiKey, popular_movies_request)
        XCTAssertEqual(request_url.absoluteString, "https://api.themoviedb.org/3/movie/popular?api_key=d2ab0c79bdb7a3a1e56cb929ae3abf11")
        
    }

}
