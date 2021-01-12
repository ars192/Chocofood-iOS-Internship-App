//
//  MarketplaceEnpoint.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/12/21.
//

import Foundation


enum MarketplaceEndPoint {
    case fetchOrders
    case postOrder
}

extension MarketplaceEndPoint: EndPoint {
    
    var url: URL {
        guard let url = Foundation.URL(string: "https://api.jsonbin.io/") else { fatalError("invalidURL") }
        return url
    }
    
    var path: String {
        switch self {
        case .postOrder:
            return "post/id"
        case .fetchOrders:
            return "b/5ff1946009f7c73f1b6d134f"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postOrder:
            return HTTPMethod.post
        case .fetchOrders:
            return HTTPMethod.get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .postOrder:
            return nil
        case .fetchOrders:
            return nil
        }
    }
    
//
//    var cookies: HTTPCookie {
//
//    }
    
}
