//
//  RequestHandler.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

class RequestHandler {
    let reachability = Reachability()!
    // function with [T]
    func networkResult<T: Parseable>(completion: @escaping (Result<[T], ErrorResult>) -> Void) -> ((Result<Data, ErrorResult>) -> Void) {
        return { dataResult in
            // Play with dataResult
            DispatchQueue.global(qos: .background).async(execute: {
                switch dataResult {
                case .success(let data):
                    ParserHelper.parse(data: data, completion: completion)
                case .failure(let error):
                    print("Network error \(error)")
                    completion(.failure(.network(string: "Network error " + error.localizedDescription)))
                }
            })
        }
    }
}
