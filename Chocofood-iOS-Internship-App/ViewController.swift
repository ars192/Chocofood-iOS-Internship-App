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
        // Do any additional setup after loading the view.
        NetworkManager().fetchOrders { [weak self] (orders) in
            for order in orders ?? [] {
                print("------")
                print(order)
                print("------")
            }
        }
    }
    
    

}

