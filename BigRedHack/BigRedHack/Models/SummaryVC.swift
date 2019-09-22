//
//  SummaryVC.swift
//  BigRedHack
//
//  Created by 紫瑶 程 on 9/22/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import Foundation
import UIKit

protocol PassIndexDelegate: class {
    func configure(index: Int)
}

class SummaryVC: UIViewController {
    
    var categoryLabel: UILabel!
    var categoryText: UITextView!
    var keywordLabel: UILabel!
    var keywordText: UITextView!
    var attitudeLabel: UILabel!
    var attitudeText: UITextView!
    
    override func viewDidLoad() {
        title = "Summary"
        view.backgroundColor = UIColor(red: 221/255, green: 239/255, blue: 255/255, alpha: 1)
        
        categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.textColor = .black
        categoryLabel.textAlignment = .center
        categoryLabel.text = "Category"
        
        keywordLabel = UILabel()
        keywordLabel.translatesAutoresizingMaskIntoConstraints = false
        keywordLabel.textColor = .black
        keywordLabel.textAlignment = .center
        keywordLabel.text = "Keyword"
        
        attitudeLabel = UILabel()
        attitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        attitudeLabel.textColor = .black
        attitudeLabel.textAlignment = .center
        attitudeLabel.text = "Attitude"
        
        categoryText = UITextView()
        categoryText.translatesAutoresizingMaskIntoConstraints = false
        categoryText.backgroundColor = .white
        categoryText.layer.cornerRadius = 10
        
        keywordText = UITextView()
        keywordText.translatesAutoresizingMaskIntoConstraints = false
        keywordText.backgroundColor = .white
        keywordText.layer.cornerRadius = 10
        
        attitudeText = UITextView()
        attitudeText.translatesAutoresizingMaskIntoConstraints = false
        attitudeText.backgroundColor = .white
        attitudeText.layer.cornerRadius = 10
        
        view.addSubview(categoryLabel)
        view.addSubview(keywordLabel)
        view.addSubview(attitudeLabel)
        view.addSubview(categoryText)
        view.addSubview(keywordText)
        view.addSubview(attitudeText)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            categoryLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            categoryText.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            categoryText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryText.heightAnchor.constraint(equalToConstant: 90),
            categoryText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            keywordLabel.topAnchor.constraint(equalTo: categoryText.bottomAnchor, constant: 20),
            keywordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            keywordLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            keywordText.topAnchor.constraint(equalTo: keywordLabel.bottomAnchor, constant: 10),
            keywordText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            keywordText.heightAnchor.constraint(equalToConstant: 90),
            keywordText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            attitudeLabel.topAnchor.constraint(equalTo: keywordText.bottomAnchor, constant: 20),
            attitudeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            attitudeLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            attitudeText.topAnchor.constraint(equalTo: attitudeLabel.bottomAnchor, constant: 10),
            attitudeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            attitudeText.heightAnchor.constraint(equalToConstant: 90),
            attitudeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }
    
}

extension SummaryVC: PassIndexDelegate {
    func configure(index: Int) {
        if index < SystemStorage.audioArray.count {
            let audio = SystemStorage.audioArray[index]
            categoryLabel.text = audio.summary[0].dataType
            categoryText.text = audio.summary[0].text
            attitudeLabel.text = audio.summary[1].dataType
            attitudeText.text = audio.summary[1].text
            keywordLabel.text = audio.summary[2].dataType
            keywordText.text = audio.summary[2].text
        }
    }
}
