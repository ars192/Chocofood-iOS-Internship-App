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

        MarketplaceAPI().fetchOrders { (result, error) in
            print(result)
        }
    }
    
    

}

