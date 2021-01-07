//
//  Models.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/7/21.
//

import Foundation


//MARK: - Add CodingKey to pk(?)

struct Order: Codable {
    let deliveryTariff:     deliveryTariff
    let deliveryTime:       deliveryTime
    let restaurant:         restaurant
    let isTopRestaurant:    Bool
}

struct deliveryTariff: Codable {
    let title:              String
    let conditions:         [Condition]
    let pk:                 String
}

struct Condition: Codable {
    let deliveryCost:       Int
    let orderMinCost:       Int
}

struct deliveryTime: Codable{
    let lowLimitMinutes:    Int
    let upperLimitMinutes:  Int
    let pk:                 String
}

struct schedule: Codable {
    let startedWeekDay:     String
    let startedAt:          time
    let endedWeekDay:       String
    let endedAt:            time
}

struct time: Codable {
    let hour:               Int
    let minute:             Int
}

struct paymentMethods: Codable {
    let cash:               Bool
    let bonus:              Bool
    let card:               Bool
    let rakhmet:            Bool
}

struct location: Codable {
    let coordinate:         coordinate
    let text:               String
}

struct coordinate: Codable {
    let latitude:           Double
    let longitude:          Double
}

struct category: Codable {
    let title:              String
    let position:           Int
    let activeIcon:         URL
    let inactiveIcon:       URL
    let pk:                 String
}

struct restaurant: Codable {
    let title:              String
    let schedule:           [schedule]
    let logo:               URL
    let image:              URL
    let synonyms:           [String]
    let paymentMethods:     paymentMethods
    let willBeDeliveredBy:  String
    let location:           location
    let pk:                 String
    let categories:         [category]
    let state:              String
    let rating:             Int
}

struct Wrapper: Codable {
    let items: [Order]
}
