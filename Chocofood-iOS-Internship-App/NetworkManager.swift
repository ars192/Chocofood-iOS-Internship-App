//
//  File.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/7/21.
//

import Foundation

class NetworkManager {
    func fetchOrders(withCompletion completion: @escaping ([Order]?)  -> Void) {
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
            let url = URL(string: "https://api.jsonbin.io/b/5ff1946009f7c73f1b6d134f")!
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let error = error {
                    print("Error with fetch: \(error)")
                    return
                }
                
                guard let data = data else {
                    completion(nil)
                    return
                }
                
//                print(String(data: data, encoding: .utf8)!)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decoded = try? decoder.decode([Order].self, from: data)
                completion(decoded)
                
            })
            task.resume()
    }
}

