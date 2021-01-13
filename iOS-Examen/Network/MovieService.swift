//
//  MovieService.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 12/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    func getMoviesFromCategory(from category: MovieListCategory) -> HttpRequest<TMDBPage<Movie>> {
        return HttpRequest(method: .get, path: "/movie/\(category.rawValue)", pars: [:])
    }
    func getSimilarMovies(for movie: Movie) -> HttpRequest<SimilarMovies> {
        return HttpRequest(method: .get, path: "/movie/\(movie.id)/similar", pars: [:])
    }
    func getMovieDetails(for movie: Movie) -> HttpRequest<MovieDetails> {
        return HttpRequest(method: .get, path: "/movie/\(movie.id)", pars: [:])
    }
    
}
enum MovieListCategory: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case topRated = "top_rated"
    case popular = "popular"
    
}
