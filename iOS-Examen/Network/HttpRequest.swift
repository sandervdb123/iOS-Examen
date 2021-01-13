
//
//  HttpRequest.swift
//  iOS-Examen
//
//  Created by Sander Vdb on 13/01/2021.
//  Copyright © 2021 Sander Vdb. All rights reserved.
//

import Foundation
enum Method: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
}

struct HttpRequest<Value> {
    
    var method: Method
    var path: String
    var pars: [String: String]
    
    init(method: Method = .get, path: String, pars: [String: String]) {
        self.method = method
        self.path = path
        self.pars = pars
    }
    
}
