//
//  MarketplaceAPI.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/10/21.
//

import Foundation

struct MarketplaceEndPoint: EndPoint {
    var URL: URL {
        guard let url = Foundation.URL(string: "https://api.jsonbin.io/") else { fatalError("invalidURL") }
        return url
    }
    var path: String {
        return "b/5ff1946009f7c73f1b6d134f"
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
    
}

struct MarketplaceAPI {
    let networkManager = NetworkManager()
    
    func fetchOrders(completion: @escaping (_ order: Any?, _ error: Any?) -> () ) {
        networkManager.request(endPoint: MarketplaceEndPoint() as EndPoint) { (data, response, error) in
//            print(String(data: data!, encoding: .utf8)!)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                let decoded = try? decoder.decode([Order].self, from: data!)
                completion(decoded, nil)
            } else {
                let error = try? decoder.decode(ErrorModel.self, from: data!)
                completion(error, nil)
            }
            
        }
    }
    
}
