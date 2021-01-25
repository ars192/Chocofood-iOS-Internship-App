//
//  CategoryCell.swift
//  Chocofood-iOS-Internship-App
//
//  Created by Arystan on 1/24/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 12)
        label.textColor = .white
        label.text = "not set"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        backgroundColor = .gray
        addSubview(title)
    }
     
    func setupConstraints() {
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setTitle(_ category: String) {
        title.text = category
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ?.green:.clear
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
