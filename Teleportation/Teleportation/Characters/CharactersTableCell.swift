//
//  CharactersTableCell.swift
//  Teleportation
//
//  Created by Майя Калицева on 15.08.2022.
//

import UIKit

final class CharactersTableCell: UITableViewCell {
    
    // MARK: - Private properties
    
    var name: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SystemFont", size: 25)
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.5)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var status: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SystemFont", size: 25)
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var species: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SystemFont", size: 25)
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var type: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SystemFont", size: 25)
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var gender: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "SystemFont", size: 25)
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var profileImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "rickandmorty") // TODO: Remove hardcode
        imgView.layer.cornerRadius = 15
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupLayout() {
        addSubview(profileImageView)
        addSubview(name)
        addSubview(status)
        addSubview(species)
        addSubview(type)
        addSubview(gender)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(5)
            make.trailing.equalTo(name.snp.leading).inset(-15)
            make.bottom.equalTo(status.snp.top).inset(-30)
            make.width.height.equalTo(30)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(profileImageView.snp.trailing).inset(15)
            make.bottom.equalTo(status.snp.top).inset(-15)
        }
        
        status.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).inset(15)
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalTo(species.snp.top).inset(-15)
        }
        
        species.snp.makeConstraints { make in
            make.top.equalTo(status.snp.bottom).inset(15)
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalTo(type.snp.top).inset(-15)
        }
        
        type.snp.makeConstraints { make in
            make.top.equalTo(species.snp.bottom).inset(15)
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalTo(gender.snp.top).inset(-15)
        }
        
        gender.snp.makeConstraints { make in
            make.top.equalTo(type.snp.bottom).inset(15)
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
    }
    
}
