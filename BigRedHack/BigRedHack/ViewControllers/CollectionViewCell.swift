//
//  CollectionViewCell.swift
//  BigRedHack
//
//  Created by myl142857 on 9/20/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    
    let padding: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        contentView.addSubview(nameLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        super.updateConstraints()
    }
    
    func configure(audio: Audio) {
        nameLabel.text = audio.audioName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
