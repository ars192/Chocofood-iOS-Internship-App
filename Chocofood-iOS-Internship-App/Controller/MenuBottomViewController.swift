//
//  BottomSheetViewController.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/24/21.
//

import UIKit
import SDWebImage

class MenuBottomViewController: UIViewController {
    
    private var categoryCollectionView: UICollectionView!
    private var menuTableView: UITableView!
    private var restaurant: Restaurant!
    private var menuList = [FoodType]()
    private var menu: [Food] = []
    private var categories: [String] = []
    private var key: String!
    private var delegate: MenuContainerProtocol?
    
    lazy var restaurantTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.text = "Хачапури Хинкальевич"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var deliveryTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.text = "Хачапури Хинкальевич"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var deliveryPrice: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.text = "not set"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    func passData(_ restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        let MarketplaceAPI = API(endPoint: MarketplaceEndPoint.fetchRestaurantMenu(self.restaurant.pk))
        MarketplaceAPI.fetchItems(type: Menu.self) { [self] (result, error) in
            if let result = result {
                self.menuList = result.foodTypes
                for item in self.menuList {
                    self.categories.append(item.title)
                    for food in item.foods {
                        dump(food)
                        menu.append(food)
                    }
                }
                print(categories)
                self.categoryCollectionView.reloadData()
                self.menuTableView.reloadData()
            } else {
                fatalError(error.debugDescription)
            }
        }
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 20
        self.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        categoryCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30), collectionViewLayout: layout)
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.backgroundColor = .gray
        categoryCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        
        menuTableView = UITableView(frame: .zero, style: .plain)
        menuTableView.showsVerticalScrollIndicator = false
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        menuTableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        restaurantTitle.text = restaurant.title
        deliveryTitle.text = "Доставка от \(restaurant.title):"
//        deliveryPrice.text = restaurant.
        
        view.addSubview(restaurantTitle)
        view.addSubview(deliveryTitle)
        view.addSubview(deliveryPrice)
        view.addSubview(categoryCollectionView)
        view.addSubview(menuTableView)
    }
    
    func setupConstraints() {
        
        restaurantTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        restaurantTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        restaurantTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        
        deliveryTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        deliveryTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        deliveryTitle.topAnchor.constraint(equalTo: restaurantTitle.bottomAnchor, constant: 20).isActive = true
        
        deliveryPrice.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        deliveryPrice.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        deliveryPrice.topAnchor.constraint(equalTo: deliveryTitle.bottomAnchor, constant: 10).isActive = true
        
        categoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoryCollectionView.topAnchor.constraint(equalTo: deliveryPrice.bottomAnchor, constant: 10).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        menuTableView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 10).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func registerTableViewCells() {
        let menuCell = UINib(nibName: "MenuCell",
                                  bundle: nil)
        self.menuTableView.register(menuCell, forCellReuseIdentifier: "MenuCell")

    }
}

extension MenuBottomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.setTitle(categories[indexPath.row])
        return cell
    }
}

extension MenuBottomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat
        let height: CGFloat
        let text = categories[indexPath.row]
        let textSize = text.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        width = textSize.width + 20
        height = 30
        
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MenuBottomViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.showBottomSheet()
        categoryCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        var counter = 0
        for item in menuList {
            if item.title == categories[indexPath.row] {
                break
            }
            counter += item.foods.count
        }
        let index = IndexPath(row: counter, section: 0)
        menuTableView.scrollToRow(at: index, at: .top, animated: true)
    }
}

extension MenuBottomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.setup(data: menu[indexPath.row])
        dump(menu[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        menuTableView.deselectRow(at: indexPath, animated: true)
//    }

}

extension MenuBottomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


