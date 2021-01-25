//
//  HelloViewController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/24/21.
//

import UIKit
import SDWebImage
class MenuTopViewController: UIViewController {
    
    private var imageUrl: URL!
    private var image: UIImage!
    
    func passImageUrl(_ url: URL) {
        self.imageUrl = url
    }
    
    lazy var imageBackground: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        imageBackground.sd_setImage(with: imageUrl)
        view.addSubview(imageBackground)
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: imageBackground.widthAnchor, multiplier: 9.0 / 16).isActive = true
        imageBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}
