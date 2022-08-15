//
//  CharactersViewController.swift
//  Teleportation
//
//  Created by Майя Калицева on 15.08.2022.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var charactersDataSource = [Result]()
    private let https = "https://rickandmortyapi.com/api/character"
    private let cellID = "CharactersTableCell"
    
    private let tableView: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .singleLine
        tbv.tableFooterView = UIView()
        tbv.rowHeight = UITableView.automaticDimension
        tbv.keyboardDismissMode = .onDrag
        return tbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingJson { data in
            self.charactersDataSource = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.register(CharactersTableCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        
        setupLayout()
    }
    
    // MARK: - Private methods
    
    private func parsingJson(completion: @escaping ([Result])->()) {
        let url = URL(string: https)
        guard url != nil else {
            print("error")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil, data != nil {
                let decoder = JSONDecoder()
                do {
                    let parsingData = try decoder.decode(TopLevel.self, from: data!)
                    completion(parsingData.results)
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
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charactersDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = charactersDataSource[indexPath.row].name
        return cell
    }
}
