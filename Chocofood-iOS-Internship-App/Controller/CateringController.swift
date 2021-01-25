//
//  CateringController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class CateringController: UIViewController {
    
    private var menuDelegate: MenuDelegate?
    private var cateringList: [Catering] = []
    private var restaurantCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 27)!,
             NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 6, right: 16)
        layout.scrollDirection = .vertical
        
        restaurantCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        restaurantCollectionView.showsVerticalScrollIndicator = false
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        restaurantCollectionView.backgroundColor = .gray
        restaurantCollectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: "RestaurantCell")
        restaurantCollectionView.register(RestaurantSmallCell.self, forCellWithReuseIdentifier: "RestaurantSmallCell")
        
        view.addSubview(restaurantCollectionView)
        
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchCateringList)
        MarketplaceAPI.fetchItems(type: [Catering].self) { (result, error) in
            if let result = result {
                self.cateringList = result
                self.restaurantCollectionView.reloadData()
            } else {
                fatalError(error.debugDescription)
            }
        }
    }
    
//    private func seses(completion: @escaping (_ result: [Catering]?, _ error: Any?) -> ()) {
//        let marketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchCateringList)
//        marketplaceAPI.fetchItems(completion: completion)
//    }
}

extension CateringController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cateringList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row % 4 == 2) || (indexPath.row % 4 == 3) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantSmallCell", for: indexPath) as! RestaurantSmallCell
            cell.bindData(with: cateringList[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            cell.bindData(with: cateringList[indexPath.row])
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
        
        let url = cateringList[indexPath.row].restaurant.image
        let catering = cateringList[indexPath.row]
        let menuTop = MenuTopViewController()
        let menuBottom = MenuBottomViewController()
        
        menuTop.passImageUrl(url)
        menuBottom.passCatering(catering)
        
        let destination = MenuContainerViewController(
            contentViewController: menuTop,
            bottomSheetViewController: menuBottom,
            bottomSheetConfiguration: .init(
                height: view.bounds.height,
                initialOffset: view.bounds.height * 0.65 + view.safeAreaInsets.bottom
            )
        )
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
