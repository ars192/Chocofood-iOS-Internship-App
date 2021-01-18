//
//  OrderTableViewCell.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/17/21.
//

import UIKit
import SDWebImage

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderRating: UILabel!
    @IBOutlet weak var orderDeliveryMinimumPrice: UILabel!
    @IBOutlet weak var orderMinimumPrice: UILabel!
    @IBOutlet weak var orderDeliveryTimeMinimum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with order: Order) {
        print(order.restaurant.title)
        orderTitle.text = order.restaurant.title
//        let imageData = try? Data(contentsOf: order.restaurant.image)
//        if imageData != nil {
//            orderImage.image = UIImage(data: imageData!)
//        }
        orderImage.sd_setImage(with: order.restaurant.image, completed: .none)
        orderRating.text = String(order.restaurant.rating)
        orderDeliveryMinimumPrice.text = String(order.deliveryTariff.conditions[0].deliveryCost)
        orderMinimumPrice.text = String(order.deliveryTariff.conditions[0].orderMinCost)
        orderDeliveryTimeMinimum.text = String(order.deliveryTime.lowLimitMinutes)
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: padding)
    }
}
