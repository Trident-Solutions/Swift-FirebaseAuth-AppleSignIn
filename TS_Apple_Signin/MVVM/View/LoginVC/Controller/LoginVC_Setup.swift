//
//  LoginVC_AppleSignIn.swift
//  Pick Me Locals
//
//  Created by Gajalakshmi on 09/12/19.
//  Copyright © 2019 Senthil. All rights reserved.
//

import UIKit
import AuthenticationServices

extension LoginVC {
    
    func setUp() {
               
        loginViewModel = LoginViewModel()
        
        handleBinding()
        
        backgroundImageView.image = #imageLiteral(resourceName: "background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 13.0, *) {
            authorizationButton = ASAuthorizationAppleIDButton()
            authorizationButton.addTarget(self, action: #selector(signInAppleButtonClicked), for: .touchUpInside)
            authorizationButton.cornerRadius = 10
            authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        } else {
            // Fallback on earlier versions
        }

        setupLayout()
    }
    
    func setupLayout(){
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(authorizationButton)
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
        ])
        
        NSLayoutConstraint.activate([
            authorizationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            authorizationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            authorizationButton.widthAnchor.constraint(equalToConstant: 280),
            authorizationButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}

