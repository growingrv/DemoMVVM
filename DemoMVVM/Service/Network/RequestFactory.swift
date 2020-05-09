//
//  RequestFactory.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

final class RequestFactory {
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }
    
    static func request(method: Method, urlPath: String) -> URLRequest? {
        let urlString: String? = endpoint() + urlPath
        var request: URLRequest?
        if let urlString = urlString {
            guard let url = URL(string: urlString) else {
                // "Wrong url format"
                return nil
            }
            request = URLRequest(url: url)
            request?.httpMethod = method.rawValue
        }
        return request
    }
    // Ideally the endpoint for all request will be common. 
    static func endpoint() -> String {
        return Constants.ServiceAPI.base
    }
}
