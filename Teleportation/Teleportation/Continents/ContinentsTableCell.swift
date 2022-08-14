//
//  ContinentsTableCell.swift
//  Teleportation
//
//  Created by Майя Калицева on 03.08.2022.
//

import UIKit

final class ContinentsTableCell: UITableViewCell {
    
    // MARK: Private Properties
    
    var continent: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.darkGray
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    
    private func setupLayout() {
        addSubview(continent)
        
        continent.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview().inset(45)
        }
    }
}
