//
//  DetailViewController.swift
//  BestBreweries
//
//  Created by Александр on 19.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(_ name: String, _ street: String, _ city: String, _ state: String, _ country: String, _ website: String) {
        self.detailView.nameLabel.text = name
        self.detailView.streetLabel.text = "Street: \(street)"
        self.detailView.cityLabel.text = "City: \(city)"
        self.detailView.stateLabel.text = "State: \(state)"
        self.detailView.countryLabel.text = "Country: \(country)"
        self.detailView.websiteLabel.text = "WebSite: \(website)"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
