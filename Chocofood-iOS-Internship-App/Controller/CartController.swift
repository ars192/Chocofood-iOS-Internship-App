//
//  CartController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class CartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 27)!,
             NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
