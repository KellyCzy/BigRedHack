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
    let cellHeight: CGFloat = 60
    
    weak var delegate: PassIndexDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
        title = "Audios"
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = padding
        flowLayout.minimumLineSpacing = padding
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor! = UIColor(red: 221/255, green: 239/255, blue: 255/255, alpha: 1)
        
        view.addSubview(collectionView)
        
        addBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = addBarButtonItem
        
        var portal = Audio(audioName: "Recording", url: "www.cornell.edu", summary: [Data(dataType: "Category", text: "Computer Science, Cornell"), Data(dataType: "Attitude", text: "Happy"), Data(dataType: "Keyword", text: "hard, prelim")])
        
        SystemStorage.audioArray = [portal, portal]
        
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
        let navViewController = RecordWhistleViewController()
        //navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }

}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let summaryVC = SummaryVC()
        navigationController?.pushViewController(summaryVC, animated: true)
        self.delegate = summaryVC as! PassIndexDelegate
        delegate.configure(index: indexPath.item)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SystemStorage.audioArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let audio = SystemStorage.audioArray[indexPath.item]
        cell.configure(audio: audio)
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * padding)
        let height = cellHeight
        return CGSize(width: width, height: cellHeight)
    }
}

