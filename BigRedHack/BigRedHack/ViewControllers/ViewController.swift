//
//  ViewController.swift
//  BigRedHack
//
//  Created by myl142857 on 9/20/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var addBarButtonItem: UIBarButtonItem!
    
    let reuseIdentifier = "collectionViewReuseIdentifier"
    let padding: CGFloat = 10
    let cellHeight: CGFloat = 50
    
    var audioArray: [Audio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Audios"
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = padding
        flowLayout.minimumLineSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
        
        addBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = addBarButtonItem
        
        var portal = Audio(audioName: "Portal", url: "www.cornell.edu", summary: "Captain America is so cute!")
        audioArray = [portal, portal, portal, portal, portal, portal, portal, portal, portal, portal, portal, portal]
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    @objc func add() {
        
    }

}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return audioArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let audio = audioArray[indexPath.item]
        cell.configure(audio: audio)
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 2 * padding)
        let height = cellHeight
        return CGSize(width: width, height: cellHeight)
    }
}

