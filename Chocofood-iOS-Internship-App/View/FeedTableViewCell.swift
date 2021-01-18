//
//  FeedTableViewCell.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/17/21.
//

import UIKit
import SDWebImage

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var firstViewTitle: UILabel!
    @IBOutlet weak var firstViewRestaurantRating: UILabel!
    @IBOutlet weak var firstViewDeliveryMinimumPrice: UILabel!
    @IBOutlet weak var firstViewDeliveryMinimumTime: UILabel!
    @IBOutlet weak var firstViewOrderMinimumPrice: UILabel!
    @IBOutlet weak var firstViewImage: UIImageView!
    
    @IBOutlet weak var secondViewTitle: UILabel!
    @IBOutlet weak var secondViewRestaurantRating: UILabel!
    @IBOutlet weak var secondViewDeliveryMinimumPrice: UILabel!
    @IBOutlet weak var secondViewDeliveryMinimumTime: UILabel!
    @IBOutlet weak var secondViewOrderMinimumPrice: UILabel!
    @IBOutlet weak var secondViewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: padding)
    }
    func setupFirstView(with order: Order) {
        firstViewTitle.text = order.restaurant.title
//        let imageData = try? Data(contentsOf: order.restaurant.image)
//        if imageData != nil {
//            firstViewImage.image = UIImage(data: imageData!)
//        }
        firstViewImage.sd_setImage(with: order.restaurant.image, completed: .none)
        firstViewRestaurantRating.text = String(order.restaurant.rating)
        firstViewDeliveryMinimumPrice.text = String(order.deliveryTariff.conditions[0].deliveryCost)
        firstViewOrderMinimumPrice.text = String(order.deliveryTariff.conditions[0].orderMinCost)
        firstViewDeliveryMinimumTime.text = String(order.deliveryTime.lowLimitMinutes)
    }
    
    func setupSecondView(with order: Order) {
        secondViewTitle.text = order.restaurant.title
//        let imageData = try? Data(contentsOf: order.restaurant.image)
//        if imageData != nil {
//            secondViewImage.image = UIImage(data: imageData!)
//        }
        secondViewImage.sd_setImage(with: order.restaurant.image, completed: .none)
        secondViewRestaurantRating.text = String(order.restaurant.rating)
        secondViewDeliveryMinimumPrice.text = String(order.deliveryTariff.conditions[0].deliveryCost)
        secondViewOrderMinimumPrice.text = String(order.deliveryTariff.conditions[0].orderMinCost)
        secondViewDeliveryMinimumTime.text = String(order.deliveryTime.lowLimitMinutes)
    }
}
