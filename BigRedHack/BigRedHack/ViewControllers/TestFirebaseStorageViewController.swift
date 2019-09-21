//
//  TestFirebaseStorageViewController.swift
//  BigRedHack
//
//  Created by myl142857 on 9/21/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import UIKit
import FirebaseStorage

class TestFirebaseStorageViewController: UIViewController {

    var textButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        textButton = UIButton()
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        textButton.setTitle("Test Firebase Storage", for: .normal)
        textButton.setTitleColor(.black, for: .normal)
        view.addSubview(textButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            textButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            textButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            textButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
    }
    
    @objc func click() {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        var dogRef = storageRef.child("images/dog.jpg")
//        var localFile = URL(fileURLWithPath: Bundle.main.path(forResource: "dog", ofType: "jpg")!)
//        
//        let uploadTask = dogRef.putFile(from: localFile, metadata: nil) { metadata, error in
//            guard let metadata = metadata else {
//                // Uh-oh, an error occurred!
//                return
//            }
//            // Metadata contains file metadata such as size, content-type.
//            let size = metadata.size
//            // You can also access to download URL after upload.
//            storageRef.downloadURL { (url, error) in
//                guard let downloadURL = url else {
//                    // Uh-oh, an error occurred!
//                    return
//                }
//            }
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
