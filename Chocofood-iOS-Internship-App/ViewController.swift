//
//  ViewController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/5/21.
//

import UIKit

class ViewController: UIViewController {
    private var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchOrders)
        MarketplaceAPI.fetchItems { (result, error) in
            if let orders = result {
                for order in orders {
                    print("----")
                    dump(order)
                    print("----")
                }
            }
        }
    }
    
    

}

