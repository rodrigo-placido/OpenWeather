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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 12.0)
        iconImageView = UIImageView(frame: CGRect.zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        
        iconImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.iconImageView.leftAnchor, constant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
