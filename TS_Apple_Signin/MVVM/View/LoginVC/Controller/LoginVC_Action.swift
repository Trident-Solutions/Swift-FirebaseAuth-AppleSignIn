//
//  LoginVC_Action.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 03/02/20.
//  Copyright © 2020 Gajalakshmi. All rights reserved.
//

import Foundation
import AuthenticationServices


extension LoginVC {
    
    @objc func signInAppleButtonClicked() {
        
        if #available(iOS 13.0, *) {
            let nonce = loginViewModel?.randomNonceString()
            currentNonce = nonce
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            request.nonce = loginViewModel?.sha256(nonce!)
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        } else {
            // Fallback on earlier versions
        }
    }
    
   
}
