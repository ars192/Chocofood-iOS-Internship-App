//
//  MenuController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/23/21.
//

import UIKit

protocol MenuDelegate {
    func passKey(key: String)
}

class MenuController: UIViewController, MenuDelegate {

    lazy var keyTitle: UILabel = {
        let title = UILabel()
        title.text = ""
        title.textColor = .red
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var key = "NULL"
    private var menuList = [FoodType]()
    func passKey(key: String) {
        self.key = key
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        keyTitle.text = self.key
        
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchRestaurantMenu(self.key))
        MarketplaceAPI.fetchItems(type: Menu.self) { (result, error) in
            if let result = result {
                self.menuList = result.foodTypes
                for item in self.menuList {
                    print("----")
                    dump(item)
                    print("----")
                }
            } else {
                fatalError(error.debugDescription)
            }
        }
        
        
        view.addSubview(keyTitle)
        keyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        keyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
