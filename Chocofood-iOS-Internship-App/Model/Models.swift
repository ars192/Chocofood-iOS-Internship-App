//
//  Models.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/7/21.
//

import Foundation


//MARK: - Add CodingKey to pk(?)

struct Catering: Codable {
    let deliveryTariff:     DeliveryTariff
    let deliveryTime:       DeliveryTime
    let restaurant:         Restaurant
    let isTopRestaurant:    Bool
}

struct DeliveryTariff: Codable {
    let title:              String
    let conditions:         [Condition]
    let pk:                 String
}

struct Condition: Codable {
    let deliveryCost:       Int
    let orderMinCost:       Int
}

struct DeliveryTime: Codable{
    let lowLimitMinutes:    Int
    let upperLimitMinutes:  Int
    let pk:                 String
}

struct Schedule: Codable {
    let startedWeekDay:     String
    let startedAt:          Time
    let endedWeekDay:       String
    let endedAt:            Time
}

struct Time: Codable {
    let hour:               Int
    let minute:             Int
}

struct PaymentMethods: Codable {
    let cash:               Bool
    let bonus:              Bool
    let card:               Bool
    let rakhmet:            Bool
}

struct Location: Codable {
    let coordinate:         Coordinate
    let text:               String
}

struct Coordinate: Codable {
    let latitude:           Double
    let longitude:          Double
}

struct Category: Codable {
    let title:              String
    let position:           Int
    let activeIcon:         URL
    let inactiveIcon:       URL
    let pk:                 String
}

struct Restaurant: Codable {
    let title:              String
    let schedule:           [Schedule]
    let logo:               URL
    let image:              URL
    let synonyms:           [String]
    let paymentMethods:     PaymentMethods
    let willBeDeliveredBy:  String
    let location:           Location
    let pk:                 String
    let categories:         [Category]
    let state:              String
    let rating:             Int
}

struct ErrorModel: Codable {
    let message:            String
//    let error:              String        // i tried to fetch invalid id and in the response body there was only message keyword
}

struct Menu: Codable {
    let foodTypes:          [FoodType]
}

struct FoodType: Codable {
    let title:              String
    let oid:                String
    let position:           Int
    let foods:              [Food]
}

struct Food: Codable {
    let title:              String
    let state:              String
    let price:              Int
    let logo:               URL?
    let sellingText:        String
    let oid:                String
    let position:           Int
}
