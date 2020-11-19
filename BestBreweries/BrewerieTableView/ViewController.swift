//
//  ViewController.swift
//  BestBreweries
//
//  Created by Александр on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let generalView = GeneralView()
    var brewerie: [BrewerieModel] = []
    private let reuseIdentifierTableView = "CellTableView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(brewerie)
        setupUI()
        getData()
    }
    
    private func setupUI() {
        view.addSubview(generalView)
        generalView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            generalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            generalView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            generalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            generalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        generalView.tableView.delegate = self
        generalView.tableView.dataSource = self
        generalView.tableView.separatorStyle = .none
        generalView.tableView.register(BrewerieTableViewCell.self, forCellReuseIdentifier: reuseIdentifierTableView)
    }
    
    func getData() {
        Network.shared.fetchData(model: [BrewerieModel].self) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let profiles):
                profiles.forEach { self.brewerie.append($0) }
                self.generalView.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewerie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTableView, for: indexPath) as! BrewerieTableViewCell
        let brew = brewerie[indexPath.row]
        cell.configure(brewerie: brew)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 3
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = brewerie[indexPath.row].name ?? ":("
        let street = brewerie[indexPath.row].street ?? ":("
        let city = brewerie[indexPath.row].city ?? ":("
        let state = brewerie[indexPath.row].state ?? ":("
        let country = brewerie[indexPath.row].country ?? ":("
        let websiteURL = brewerie[indexPath.row].website_url ?? ":("
        let vc = DetailViewController(name, street, city, state, country, websiteURL)
        navigationController?.pushViewController(vc, animated: true)
    }
}

