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

    private let characters: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 25)
        btn.layer.borderWidth = 1
        btn.backgroundColor = UIColor.white
        btn.setTitle("  Characters  ", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let locations: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 25)
        btn.layer.borderWidth = 1
        btn.setTitle("  Locations  ", for: .normal)
        btn.backgroundColor = UIColor.white
        btn.titleLabel?.textColor = UIColor.darkGray
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let episodes: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 18
        btn.clipsToBounds = true
        btn.setTitle("  Episodes  ", for: .normal)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.font = UIFont(name: "SystemFont", size: 25)
        btn.layer.borderWidth = 1
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleLabel?.textColor = UIColor.darkGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rickandmorty")
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
        view.addSubview(backgroundImage)
        view.addSubview(characters)
        view.addSubview(locations)
        view.addSubview(episodes)
        
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        characters.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(locations.snp.top).inset(-50)
        }
        
        locations.snp.makeConstraints { make in
            make.top.equalTo(characters.snp.bottom).inset(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(episodes.snp.top).inset(-50)
        }
        
        episodes.snp.makeConstraints { make in
            make.top.equalTo(locations.snp.bottom).inset(50)
            make.centerX.equalToSuperview()
        }
    }
}
