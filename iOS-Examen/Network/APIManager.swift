//
//  APIManager.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    let baseUrl = "https://api.themoviedb.org/3"
    let apiKey = "d2ab0c79bdb7a3a1e56cb929ae3abf11"
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetch<Value: Decodable>(_ httpRequest: HttpRequest<Value>, completion: @escaping (Result<Value, NetworkErrors>) -> Void) {
        urlSession.dataTask(with: createUrlRequest(for: httpRequest)) { responseData, response, error in
            if let data = responseData {
                let response: Value
                do {
                    response = try JSONDecoder().decode(Value.self, from: data)
                } catch {
                    completion(.failure(.parsingError))
                    return
                }
                completion(.success(response))
            } else {
                completion(.failure(.networkError))
            }
        }.resume()
    }
    
    private func createUrlRequest<Value>(for httpRequest: HttpRequest<Value>) -> URLRequest {
        let url = URL(baseUrl, apiKey, httpRequest)
        var result = URLRequest(url: url)
        result.httpMethod = httpRequest.method.rawValue
        return result
    }
    
}

extension URL {
    func url(with queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = (components.queryItems ?? []) + queryItems
        return components.url!
    }
    
    init<Value>(_ host: String, _ apiKey: String, _ httpRequest: HttpRequest<Value>) {
        var queryItems = [ ("api_key", apiKey) ]
            .map { name, value in URLQueryItem(name: name, value: "\(value)") }
        
        for param in httpRequest.pars
        {
            let url_query_item = URLQueryItem(name: param.key, value: param.value)
            queryItems.append(url_query_item)
        }
        
        let url = URL(string: host)!
            .appendingPathComponent(httpRequest.path)
            .url(with: queryItems)
        
        self.init(string: url.absoluteString)!
    }
}

enum NetworkErrors: Error {
    case networkError
    case parsingError
}
