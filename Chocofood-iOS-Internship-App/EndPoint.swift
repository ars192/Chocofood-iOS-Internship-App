//
//  EndPointType.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/10/21.
//

import Foundation


public protocol EndPoint {
    var URL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get}
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
}
