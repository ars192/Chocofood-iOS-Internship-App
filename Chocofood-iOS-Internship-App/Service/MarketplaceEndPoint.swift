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
    var task: HTTPTask {
        switch self {
        case .fetchOrders:
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["longitude": "77.006425", "latitude" : "43.34061"])
        case .postOrder:
            return .request
        }
    }
    
    
    var url: URL {
        guard let url = Foundation.URL(string: "https://hermes.chocofood.kz/api/") else { fatalError("invalidURL") }
        return url
    }
    
    var path: String {
        switch self {
        case .postOrder:
            return "post/id"
        case .fetchOrders:
            return "delivery_areas/restaurants/"
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
