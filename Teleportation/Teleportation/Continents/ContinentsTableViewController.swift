//
//  ContinentsTableViewController.swift
//  Teleportation
//
//  Created by Майя Калицева on 03.08.2022.
//

import UIKit

final class ContinentsTableViewController: UITableViewController {
    
    // MARK: Public Properties
    
    let cellID = "ContinentsTableViewController"
    var continentsArray = [ContinentRoot]() // main again
    let json = "https://api.teleport.org/api/continents/"
    let response = [ContinentsResponse]()
    
    // MARK: Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ContinentsTableCell.self, forCellReuseIdentifier: cellID)
        getContinentsList()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let currentLastItem = continentsArray[indexPath.row]
        cell.textLabel?.text = currentLastItem.links.continentItems.map({$0.name}).joined(separator: " \n ")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentsArray.count
    }
    
    // MARK: Private Methods
    
    private func getContinentsList() {
        guard let url = URL(string: "https://api.teleport.org/api/continents/") else { fatalError("URL failed")}
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data {
                guard let continent = try? JSONDecoder().decode(ContinentRoot.self, from: data) else { fatalError("DecodingError \(error!)") // REMEMBER: the highest struct
                }
                self?.continentsArray.append(continent)
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.resume()
    }
}
