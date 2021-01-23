//
//  RestaurantCell.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/19/21.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    
    lazy var restaurantTitle: UILabel! = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 17)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.text = "Хачапури Хинкальевич"
        title.textAlignment = .center
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var restaurantImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "fastFood")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var restaurantRating: UILabel! = {
        let rating = UILabel()
        rating.font = UIFont(name: "AvenirNext-Medium", size: 10)
        rating.textColor = .white
        rating.text = "4.8"
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating  .contentMode = .center
        return rating
    }()
    
    lazy var starImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "star")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var ratingView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 48/100)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var restaurantDeliveryMinPrice: UILabel! = {
        let price = UILabel()
        price.font = UIFont(name: "AvenirNext-Medium", size: 10)
        price.textColor = .white
        price.text = "от 300 тг"
        price.contentMode = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var scooterImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "scooter")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var deliveryPriceView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var restaurantOrderMinPrice: UILabel! = {
        let price = UILabel()
        price.font = UIFont(name: "AvenirNext-Medium", size: 10)
        price.textColor = UIColor(red: 133/255, green: 136/255, blue: 139/255, alpha: 1)
        price.text = "3000 тг"
        price.contentMode = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    lazy var currencyTengeImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "currencyTenge")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var priceView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var restaurantDeliveryMinTime: UILabel! = {
        let time = UILabel()
        time.font = UIFont(name: "AvenirNext-Regular", size: 10)
        time.textColor = UIColor(red: 133/255, green: 136/255, blue: 139/255, alpha: 1)
        time.text = "3000 тг"
        time.contentMode = .center
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    lazy var timerImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "timer")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var deliveryTimeView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var infoView: UIStackView! = {
        let view = UIStackView()
        view.spacing = 12
        view.distribution = .equalSpacing
        view.axis = .horizontal
//        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupViews() {
        backgroundColor = .white
        layer.masksToBounds = false
        layer.cornerRadius = 5

        addSubview(restaurantTitle)
        addSubview(restaurantImage)
        
        ratingView.addSubview(starImage)
        ratingView.addSubview(restaurantRating)
        infoView.addArrangedSubview(ratingView)

        deliveryPriceView.addSubview(scooterImage)
        deliveryPriceView.addSubview(restaurantDeliveryMinPrice)
        infoView.addArrangedSubview(deliveryPriceView)

        priceView.addSubview(currencyTengeImage)
        priceView.addSubview(restaurantOrderMinPrice)
        infoView.addArrangedSubview(priceView)

        deliveryTimeView.addSubview(timerImage)
        deliveryTimeView.addSubview(restaurantDeliveryMinTime)
        infoView.addArrangedSubview(deliveryTimeView)
        
        addSubview(infoView)
    }
     
    func setupConstraints() {
        restaurantTitle.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        restaurantTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        restaurantTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        restaurantImage.topAnchor.constraint(equalTo: restaurantTitle.bottomAnchor, constant: 5).isActive = true
        restaurantImage.widthAnchor.constraint(equalTo: widthAnchor, constant: -16).isActive = true
        restaurantImage.heightAnchor.constraint(equalTo: restaurantImage.widthAnchor, multiplier: 9.0 / 16).isActive = true
        restaurantImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        infoView.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 8).isActive = true
        infoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        infoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        starImage.leftAnchor.constraint(equalTo: ratingView.leftAnchor, constant: 6).isActive = true
        starImage.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        
        restaurantRating.leftAnchor.constraint(equalTo: starImage.rightAnchor, constant: 6).isActive = true
        restaurantRating.centerYAnchor.constraint(equalTo: starImage.centerYAnchor).isActive = true
        restaurantRating.rightAnchor.constraint(equalTo: ratingView.rightAnchor, constant: -7).isActive = true
        
        scooterImage.leftAnchor.constraint(equalTo: deliveryPriceView.leftAnchor, constant: 6.75).isActive = true
        scooterImage.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        
        restaurantDeliveryMinPrice.leftAnchor.constraint(equalTo: scooterImage.rightAnchor, constant: 5.75).isActive = true
        restaurantDeliveryMinPrice.centerYAnchor.constraint(equalTo: scooterImage.centerYAnchor).isActive = true
        restaurantDeliveryMinPrice.rightAnchor.constraint(equalTo: deliveryPriceView.rightAnchor, constant: -6.75).isActive = true
        
        currencyTengeImage.leftAnchor.constraint(equalTo: priceView.leftAnchor, constant: 6.75).isActive = true
        currencyTengeImage.centerYAnchor.constraint(equalTo: priceView.centerYAnchor).isActive = true
        
        restaurantOrderMinPrice.leftAnchor.constraint(equalTo: currencyTengeImage.rightAnchor, constant: 5.75).isActive = true
        restaurantOrderMinPrice.centerYAnchor.constraint(equalTo: currencyTengeImage.centerYAnchor).isActive = true
        restaurantOrderMinPrice.rightAnchor.constraint(equalTo: priceView.rightAnchor, constant: -6.75).isActive = true
        
        timerImage.leftAnchor.constraint(equalTo: deliveryTimeView.leftAnchor, constant: 6.75).isActive = true
        timerImage.centerYAnchor.constraint(equalTo: deliveryTimeView.centerYAnchor).isActive = true
        
        restaurantDeliveryMinTime.leftAnchor.constraint(equalTo: timerImage.rightAnchor, constant: 5.75).isActive = true
        restaurantDeliveryMinTime.centerYAnchor.constraint(equalTo: timerImage.centerYAnchor).isActive = true
        restaurantDeliveryMinTime.rightAnchor.constraint(equalTo: deliveryTimeView.rightAnchor, constant: -6.75).isActive = true
        
    }
    
    func bindData(with order: Order) {
        print(order.restaurant.title)
        restaurantTitle.text = order.restaurant.title
        restaurantImage.sd_setImage(with: order.restaurant.image, completed: .none)
        restaurantRating.text = "\(Double(order.restaurant.rating)*5/100)"
        restaurantDeliveryMinPrice.text = "от \(order.deliveryTariff.conditions[0].deliveryCost) тг"
        restaurantOrderMinPrice.text = "\(order.deliveryTariff.conditions[0].orderMinCost) тг"
        restaurantDeliveryMinTime.text = "\(order.deliveryTime.lowLimitMinutes) мин."
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

