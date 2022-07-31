//
//  MainScreenVC.swift
//  Teleportation
//
//  Created by Майя Калицева on 31.07.2022.
//

import UIKit
import SnapKit

final class MainScreenVC: UIViewController {
    
    // MARK: Private Properties

    private let continent: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 30)
        btn.layer.borderWidth = 1
        btn.setTitle("Continents", for: .normal)
        btn.backgroundColor = UIColor.brown.withAlphaComponent(0.5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let country: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 30)
        btn.layer.borderWidth = 1
        btn.setTitle("Countries", for: .normal)
        btn.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let city: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.setTitle("Cities", for: .normal)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 30)
        btn.layer.borderWidth = 1
        btn.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let backgroundColor: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Life-Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: Private Methods

    private func setupLayout() {
        view.addSubview(backgroundColor)
        view.addSubview(continent)
        view.addSubview(country)
        view.addSubview(city)
        
        backgroundColor.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        continent.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.equalToSuperview().inset(40)
            make.bottom.equalTo(country.snp.top).inset(-150)
        }
        
        country.snp.makeConstraints { make in
            make.top.equalTo(continent.snp.bottom).inset(150)
            make.leading.equalToSuperview().inset(90)
            make.bottom.equalTo(city.snp.top).inset(-150)
        }
        
        city.snp.makeConstraints { make in
            make.top.equalTo(country.snp.bottom).inset(100)
            make.leading.equalToSuperview().inset(40)
        }
    }
}
