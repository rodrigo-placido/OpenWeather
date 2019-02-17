//
//  WeatherListTableViewCell.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 14/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {
    var nameLabel: UILabel
    var iconImageView: UIImageView
    var tempLabel: UILabel
    var distanceLabel: UILabel
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 12.0)
        nameLabel.textColor = UIColor(r: 50, g: 50, b: 50, alpha: 1)
        iconImageView = UIImageView(frame: CGRect.zero)
        
        tempLabel = UILabel(frame: CGRect.zero)
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont(name: nameLabel.font.fontName, size: 11.0)

        distanceLabel = UILabel(frame: CGRect.zero)
        distanceLabel.font = UIFont(name: nameLabel.font.fontName, size: 10.0)
        distanceLabel.textColor = UIColor(r: 125, g: 125, b: 125, alpha: 1)

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(distanceLabel)
        
        iconImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        distanceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        tempLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: self.iconImageView.leftAnchor, constant: 20).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.tempLabel.rightAnchor, constant: 0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.distanceLabel.leftAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
