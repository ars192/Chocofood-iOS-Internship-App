//
//  ViewController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/5/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    private var orders: [Order] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.backgroundView = nil
        tableview.backgroundColor = .clear
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        self.registerTableViewCells()
        
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchOrders)
        MarketplaceAPI.fetchItems { (result, error) in
            if let result = result {
                self.orders = result
                self.tableview.reloadData()
            } else {
                fatalError(error.debugDescription)
            }
        }
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
//        [1 2 {3 4} 5 6 {7 8} 9 10] - 8 cell
        return self.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        0 1 {2} 3 4 {5} 6 7 - indexPath
//        [0 1 {2 3} 4 5 {6 7} 8 9 ] orders
        if  (indexPath.row % 4 == 2){
            let cell = tableview.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
            cell.setupFirstView(with: orders[indexPath.row])
            cell.setupSecondView(with: orders[indexPath.row + 1])
            return cell
        } else if (indexPath.row % 4 == 3) {
            let cell = UITableViewCell()
            cell.isHidden = true
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
            cell.setup(with: orders[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row % 4 == 3) {
            return 0
        }
        
        return UITableView.automaticDimension
        
    }
    
    private func registerTableViewCells() {
        let orderCell = UINib(nibName: "OrderTableViewCell",
                                  bundle: nil)
        let feedCell = UINib(nibName: "FeedTableViewCell", bundle: nil)
        self.tableview.register(feedCell, forCellReuseIdentifier: "FeedTableViewCell")
        self.tableview.register(orderCell,
                                forCellReuseIdentifier: "OrderTableViewCell")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
}

