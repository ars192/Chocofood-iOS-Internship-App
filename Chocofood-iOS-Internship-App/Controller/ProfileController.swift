//
//  ProfileController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 27)!,
             NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
