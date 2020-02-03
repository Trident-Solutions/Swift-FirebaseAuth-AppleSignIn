//
//  LoginVC_ASAuthorization.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 03/02/20.
//  Copyright © 2020 Gajalakshmi. All rights reserved.
//

import Foundation
import AuthenticationServices

extension LoginVC : ASAuthorizationControllerDelegate , ASAuthorizationControllerPresentationContextProviding{
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            guard let nonce = currentNonce else {
                fatalError(CommonError.InvalidStateError.rawValue)
            }
            
            guard let appleIDToken = appleIDCredential.identityToken else {
                print(CommonError.IdentifyTokenError)
                return
            }
            
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print( "\(CommonError.TokenError) \(appleIDToken.debugDescription)")
                return
            }
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
            print("\(userDetails.Identifier.rawValue) \(userIdentifier), \(userDetails.FirstName.rawValue) \(String(describing: userFirstName)),\(userDetails.LastName.rawValue) \(String(describing: userLastName)),\(userDetails.Email.rawValue) \(String(describing: userEmail))")
            loginViewModel?.performAppleSignIn(idTokenString: idTokenString, rawNonce: nonce)

        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("\(error)")
    }
    
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
