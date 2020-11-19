//
//  DetailView.swift
//  BestBreweries
//
//  Created by Александр on 19.11.2020.
//

import UIKit

class DetailView: UIView {
    
    let nameLabel = UILabel()
    let streetLabel = UILabel()
    let cityLabel = UILabel()
    let stateLabel = UILabel()
    let countryLabel = UILabel()
    let websiteLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(nameLabel)
        addSubview(streetLabel)
        addSubview(cityLabel)
        addSubview(stateLabel)
        addSubview(countryLabel)
        addSubview(websiteLabel)
        
        nameLabel.font = UIFont(name: "Helvetica", size: 20)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            streetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            streetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            cityLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 40),
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 40),
            stateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            countryLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 40),
            countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            websiteLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 40),
            websiteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
        ])
    }
    
}
