//
//  MenuCell.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/25/21.
//

import UIKit

class MenuCell: UITableViewCell {
    
    lazy var menuImage: UIImageView! = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var menuTitle: UILabel! = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.textAlignment = .left
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var menuDescription: UILabel! = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Medium", size: 12)
        title.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var menuPrice: UILabel! = {
        let title = UILabel()
        title.font = UIFont(name: "AvenirNext-Bold", size: 14)
        title.textColor = .red
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var addToCart: UIButton! = {
        let button = UIButton()
        return button
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.masksToBounds = true
        addSubview(menuImage)
        addSubview(menuTitle)
        addSubview(menuDescription)
        addSubview(menuPrice)
    }
     
    func setupConstraints() {
        menuImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        menuImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        menuImage.heightAnchor.constraint(equalTo: menuImage.widthAnchor, multiplier: 9.0 / 16).isActive = true
        menuImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        menuTitle.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 20).isActive = true
        menuTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        menuTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        menuDescription.topAnchor.constraint(equalTo: menuTitle.bottomAnchor, constant: 15).isActive = true
        menuDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        menuDescription.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        menuPrice.topAnchor.constraint(equalTo: menuDescription.bottomAnchor, constant: 10).isActive = true
        menuPrice.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        menuPrice.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        menuPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
    }

    func setup(data: Food) {
        menuImage.sd_setImage(with: data.logo, completed: nil)
        menuTitle.text = data.title
        menuDescription.text = data.sellingText
        menuPrice.text = String(data.price)
    }
}
