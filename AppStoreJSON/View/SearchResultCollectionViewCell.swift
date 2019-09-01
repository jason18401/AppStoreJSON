//
//  SearchResultCollectionViewCell.swift
//  AppStoreJSON
//
//  Created by Jason Yu on 8/30/19.
//  Copyright © 2019 Jason Yu. All rights reserved.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 65).isActive = true  //adjust width of stackView
        iv.heightAnchor.constraint(equalToConstant: 65).isActive = true //this is why the stackView top doesn't get stretched
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView{
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //vertical stackView
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsStackView.axis = .vertical
        
        //horizonal stackView
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton]) //added labelsStackView to have a vertical stackView within horizontal stackView
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center //to center labelsStackView
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotStackView.axis = .horizontal
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [infoTopStackView, screenshotStackView])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))   //from helper class
//        stackView.translatesAutoresizingMaskIntoConstraints = false //to use autolayout
//        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true //to the left
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
