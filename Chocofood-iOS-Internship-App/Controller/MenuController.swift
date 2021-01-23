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
        title.text = "not passed"
        title.textColor = .red
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var key = "NULL"
    
    func passKey(key: String) {
        self.key = key
    }
    
//    init(key: String) {
//        self.key = key
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        keyTitle.text = self.key
        view.addSubview(keyTitle)
        keyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        keyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
//    override func loadView() {
//        super.loadView()
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
