//
//  AddVC.swift
//  BigRedHack
//
//  Created by 紫瑶 程 on 9/20/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import UIKit


class AddVC: UIViewController {
    
    var navItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        title = "What's that Whistle?"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhistle))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: nil, action: nil)
    }
    
    @objc func addWhistle() {
        let vc = RecordWhistleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
