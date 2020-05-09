//
//  RequestService.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

final class RequestService {
    func loadData(urlPath: String,
                  session: URLSession = URLSession(configuration: .default),
                  completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        let request = RequestFactory.request(method: .GET, urlPath: urlPath)
        guard var requestFormed = request else {
            return nil
        }
        if let reachability = Reachability(), !reachability.isReachable {
            requestFormed.cachePolicy = .returnCacheDataDontLoad
        }
        let task = session.dataTask(with: requestFormed, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string: "An error occured during request :" + error.localizedDescription)))
                return
            }            
            if let data = data {
                completion(.success(data))
            }
        })
        task.resume()
        return task
    }
}
