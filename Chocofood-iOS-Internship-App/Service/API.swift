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
    // api generic
    //associatedTypes?
    
    func fetchItems<T:Codable>(type: T.Type, completion: @escaping (_ result: T?, _ error: Any?) -> () ) { //errors
        networkManager.request(endPoint: endPoint) { (data, response, error) in
            
//            print(String(data: data!, encoding: .utf8)!)
            // swift result
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                    do {
                        let orders = try decoder.decode(T.self, from: data!)
                        completion(orders, nil)
                    } catch {
                        completion(nil, error.localizedDescription)
                    }
                    
                } else {
//                    let error = try? decoder.decode(ErrorModel.self, from: error.debugDescription)
                    completion(nil, error.debugDescription)
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
