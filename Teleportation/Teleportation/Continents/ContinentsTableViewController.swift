//
//  ContinentsTableViewController.swift
//  Teleportation
//
//  Created by Майя Калицева on 03.08.2022.
//

import UIKit

final class ContinentsTableViewController: UIViewController {
    
    // MARK: Public Properties

    var continentsArray = [ContinentRoot]()
    let json = "https://api.teleport.org/api/continents/" // data source array
    
    // MARK: Private Properties
    
    private let tableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .singleLine
        tbv.tableFooterView = UIView()
        tbv.rowHeight = UITableView.automaticDimension
        tbv.keyboardDismissMode = .onDrag
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    }()
    
    // MARK: Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApi { result in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContinentsTableCell.self, forCellReuseIdentifier: "ContinentsTableViewController")
        setupLayout()
    }
    
    // MARK: Private Methods
    
    private func fetchApi(completion: @escaping (ContinentRoot) -> ()) {
        let url = URL(string: json)
        guard url != nil else {
            print("Error")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                print("Data was nil")
                return
            }
            guard let continentsList = try? JSONDecoder().decode(ContinentRoot.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            self.continentsArray.append(continentsList)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        dataTask.resume()
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension ContinentsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContinentsTableViewController", for: indexPath)
        let model = continentsArray[indexPath.row].links.continentItems
        let model2 = model[indexPath.row].name
        print("Model: \(model2)")
        cell.textLabel?.text = model2
        return cell
    }
}
