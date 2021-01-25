//
//  MainTabController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.setImage(UIImage(named: "currencyTenge"), for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return button
    }()
    
    @objc
    func nextPage() {
        print("tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.tabBarController?.tabBar.barStyle = .default
//        self.navigationController?.tabBarController?.tabBar.barTintColor = .none
//        self.navigationController?.tabBarController?.tabBar.backgroundColor = .none
        configureViewControllers()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        view.tintColor = .red
//        view.addSubview(actionButton)
//        actionButton.translatesAutoresizingMaskIntoConstraints = false
//        actionButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
//        actionButton.widthAnchor.constraint(equalToConstant: 56).isActive = true
//        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
//        actionButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
//        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        let catering = CateringController()
        let nav1 = templateNavigationController(image: UIImage(named: "catering"), rootViewController: catering)
        nav1.tabBarItem.title = "Заведения"
        
        let sale = SaleController()
        let nav2 = templateNavigationController(image: UIImage(named: "tag"), rootViewController: sale)
        nav2.tabBarItem.title = "Акции"
        
        let profile = ProfileController()
        let nav3 = templateNavigationController(image: UIImage(named: "profile"), rootViewController: profile)
        nav3.tabBarItem.title = "Профиль"
        
        let cart = CartController()
        let nav4 = templateNavigationController(image: UIImage(named: "cart"), rootViewController: cart)
        nav4.tabBarItem.title = "Корзина"
        
        let controllers = [nav1, nav2, nav3, nav4]
        viewControllers = controllers
        
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
//        nav.isNavigationBarHidden = true
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        return nav
    }
}
