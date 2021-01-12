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
        
        var request = URLRequest(url: endPoint.url.appendingPathComponent(endPoint.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10)
        request.httpMethod = endPoint.method.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let headers = endPoint.headers {
            addHeaders(headers: headers, request: &request)
        } else {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        let session = URLSession(configuration: .default)
        
        //MARK: - TODO: DispatchQueue.global(qos: .background)
        //MARK: - TODO: change to background treads using gcd
        
        task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            completion(data, response, error)
            self.task?.cancel()
        })
        
        self.task?.resume()
    }
    
    fileprivate func addHeaders(headers: HTTPHeaders, request: inout URLRequest) {
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}

