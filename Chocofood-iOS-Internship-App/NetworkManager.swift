//
//  File.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/7/21.
//

import Foundation

class NetworkManager {
    
    private var task: URLSessionTask?
    
    func request(endPoint: EndPoint, withCompletion completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()) {
        
        var request = URLRequest(url: endPoint.URL.appendingPathComponent(endPoint.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        request.httpMethod = endPoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            completion(data, response, error)
        })
        
        self.task?.resume()
//        self.task?.cancel()
    }
}

