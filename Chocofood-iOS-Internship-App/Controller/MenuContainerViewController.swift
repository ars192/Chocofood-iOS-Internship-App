//
//  ContainerViewController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/24/21.
//

import UIKit

protocol MenuContainerProtocol {
    func showBottomSheet()
}

final class MenuContainerViewController: BottomSheetContainerViewController<MenuTopViewController, MenuBottomViewController>, MenuContainerProtocol {
    
    func showBottomSheet() {
        self.showBottomSheet(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.backBarButtonItem?.customView?.isHidden = false
        // Make the navigation bar background clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

}
