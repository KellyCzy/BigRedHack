//
//  SignInViewController.swift
//  BigRedHack
//
//  Created by myl142857 on 9/21/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    var appNameLabel: UILabel!
    var signInButton: GIDSignInButton!
    
    let verticalSpace: CGFloat = 125
    let appName = "Happy place happy place!"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        appNameLabel = UILabel()
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = appName
        appNameLabel.textAlignment = .center
        view.addSubview(appNameLabel)
        
        signInButton = GIDSignInButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.style = .wide
        view.addSubview(signInButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalSpace),
            appNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalSpace + 80)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 100),
            signInButton.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: verticalSpace),
            //signInButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: 60)
            ])
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
