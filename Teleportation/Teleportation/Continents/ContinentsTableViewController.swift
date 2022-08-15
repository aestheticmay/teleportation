//
//  ContinentsTableViewController.swift
//  Teleportation
//
//  Created by Майя Калицева on 03.08.2022.
//

import UIKit

final class ContinentsTableViewController: UIViewController {
    
    // MARK: Public Properties

    var continentsArray = [ContinentsResponse]()
    let json = "https://api.teleport.org/api/continents/"
    
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
    
    // MARK: Life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingJson { data in
            self.continentsArray = data
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
    
    private func parsingJson(completion: @escaping ([ContinentsResponse])->()) {
           let url = URL(string: json)
           guard url != nil else {
               print("error")
               return
           }
           let session = URLSession.shared
           let dataTask = session.dataTask(with: url!) { data, response, error in
               if error == nil, data != nil {
                   let decoder = JSONDecoder()
                   do {
                       let parsingData = try decoder.decode(ContinentRoot.self, from: data!)
                       completion(parsingData.links.continentItems)
                   } catch {
                       print("Parsing Error")
                   }
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
        let model = continentsArray[indexPath.row].name
        cell.textLabel?.text = model
        return cell
    }
}
