//
//  CateringController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class CateringController: UIViewController {
    
    private var menuDelegate: MenuDelegate?
    private var orders: [Order] = []
    
    var restaurantCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . purple
        
//        let view = UIView()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 6, right: 16)
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 
        restaurantCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        restaurantCollectionView.showsVerticalScrollIndicator = false
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        restaurantCollectionView.backgroundColor = .gray
        restaurantCollectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: "RestaurantCell")
        restaurantCollectionView.register(RestaurantSmallCell.self, forCellWithReuseIdentifier: "RestaurantSmallCell")
        view.addSubview(restaurantCollectionView)
        
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchOrders)
        MarketplaceAPI.fetchItems { (result, error) in
            if let result = result {
                self.orders = result
                self.orders.reverse()
                self.restaurantCollectionView.reloadData()
            } else {
                fatalError(error.debugDescription)
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
//    private func goToCatering() {
//        navigationController?.pushViewController(MenuController(), animated: true)
//    }

}

extension CateringController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row % 4 == 2) || (indexPath.row % 4 == 3) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantSmallCell", for: indexPath) as! RestaurantSmallCell
            cell.bindData(with: orders[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            cell.bindData(with: orders[indexPath.row])
            return cell
        }
    }
}

extension CateringController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat
        let height: CGFloat
        if (indexPath.row % 4 == 2) || (indexPath.row % 4 == 3) {
            width = collectionView.frame.width / 2 - 32
            height = 130
        } else {
            width = (collectionView.frame.width) - 32
            height = 280
        }
        print("Width of: \(width)")
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
}

extension CateringController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destination = MenuController()
        menuDelegate = destination
        menuDelegate?.passKey(key: orders[indexPath.row].restaurant.pk)
        navigationController?.pushViewController(destination, animated: true)
    }
}
