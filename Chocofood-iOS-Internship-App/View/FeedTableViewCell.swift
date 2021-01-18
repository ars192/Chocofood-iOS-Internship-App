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
        firstViewImage.sd_setImage(with: order.restaurant.image, completed: .none)
        firstViewRestaurantRating.text = "\(Double(order.restaurant.rating)*5/100)"
        firstViewDeliveryMinimumPrice.text = "от \(order.deliveryTariff.conditions[0].deliveryCost) тг"
        firstViewOrderMinimumPrice.text = "\(order.deliveryTariff.conditions[0].orderMinCost) тг"
        firstViewDeliveryMinimumTime.text = "\(order.deliveryTime.lowLimitMinutes) мин."
    }
    
    func setupSecondView(with order: Order) {
        secondViewTitle.text = order.restaurant.title
        secondViewImage.sd_setImage(with: order.restaurant.image, completed: .none)
        secondViewRestaurantRating.text = "\(Double(order.restaurant.rating)*5/100)"
        secondViewDeliveryMinimumPrice.text = "от \(order.deliveryTariff.conditions[0].deliveryCost) тг"
        secondViewOrderMinimumPrice.text = "\(order.deliveryTariff.conditions[0].orderMinCost) тг"
        secondViewDeliveryMinimumTime.text = "\(order.deliveryTime.lowLimitMinutes) мин."
    }
}
