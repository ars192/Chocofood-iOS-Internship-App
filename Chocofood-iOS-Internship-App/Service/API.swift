//
//  MarketplaceAPI.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/10/21.
//

import Foundation


struct API {
    
    let networkManager = NetworkManager()
    
    private let endPoint: EndPoint
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    //associatedTypes?
    
    func fetchItems(completion: @escaping (_ result: [Order]?, _ error: Any?) -> () ) { //errors
        networkManager.request(endPoint: endPoint) { (data, response, error) in
            
//            print(String(data: data!, encoding: .utf8)!)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                    let orders = try? decoder.decode([Order].self, from: data!)
                    completion(orders, nil)
                } else {
                    let error = try? decoder.decode(ErrorModel.self, from: data!)
                    completion(nil, error)
                }
            }
        }
    }
    
//    func fetch<T:Codable>(completion: @escaping (_ result: T?, _ error: Any?) -> () ) { //errors
//        networkManager.request(endPoint: endPoint) { (data, response, error) in
//
////            print(String(data: data!, encoding: .utf8)!)
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//            if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
//                let orders = try? decoder.decode(T.self, from: data!)
//                completion(orders, nil)
//            } else {
//                let error = try? decoder.decode(ErrorModel.self, from: data!)
//                completion(nil, error)
//            }
//        }
//    }
}
