//
//  BrewerieTableViewCell.swift
//  BestBreweries
//
//  Created by Александр on 18.11.2020.
//

import UIKit

class BrewerieTableViewCell: UITableViewCell {
    var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(nameLabel)
        nameLabel.textColor = UIColor(red: 0.496, green: 0.496, blue: 0.496, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameLabel.textAlignment = .left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    private func setupUI() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        
        selectionStyle = .none
    }
    
    func configure(brewerie: BrewerieModel) {
        nameLabel.text = "Name: \(brewerie.name!)"
    }

}
