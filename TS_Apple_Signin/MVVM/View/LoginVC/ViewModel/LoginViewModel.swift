//
//  LoginViewModel.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 03/02/20.
//  Copyright © 2020 Gajalakshmi. All rights reserved.
//

import UIKit
import FirebaseAuth
import CryptoKit

protocol LoginProtocol {

    var onShowAlert: ((_ message: String) -> Void)?  { get set }

    func performAppleSignIn(idTokenString:String,rawNonce:String)
}

class LoginViewModel : LoginProtocol {

    var onShowAlert: ((String) -> Void)?

    
    func performAppleSignIn(idTokenString:String,rawNonce:String){
                
        let credential = OAuthProvider.credential(withProviderID:Identifier.apple.rawValue,
                                                  idToken: idTokenString,
                                                  rawNonce: rawNonce)
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let err = error {
                DispatchQueue.main.async {
                    self.onShowAlert?("\(err)")
                    return
                }
            }
            if let _ = user?.user.uid {
                self.onShowAlert?(AlertMessage.AccountCreated.rawValue)
            }
            else { return}
        })
    }
    
    func randomNonceString(length: Int = 32) -> String {
           precondition(length > 0)
           let charset: Array<Character> =
            Array(Enctyption.randomString.rawValue)
           var result = ""
           var remainingLength = length
           
           while remainingLength > 0 {
               let randoms: [UInt8] = (0 ..< 16).map { _ in
                   var random: UInt8 = 0
                   let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                   if errorCode != errSecSuccess {
                    fatalError("\(CommonError.EnctyptionError)\(errorCode)")
                   }
                   return random
               }
               
               randoms.forEach { random in
                   if length == 0 {
                       return
                   }
                   
                   if random < charset.count {
                       result.append(charset[Int(random)])
                       remainingLength -= 1
                   }
               }
           }
           
           return result
       }

       func sha256(_ input: String) -> String {
           let inputData = Data(input.utf8)
           var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
           inputData.withUnsafeBytes {
               _ = CC_SHA256($0.baseAddress, CC_LONG(inputData.count), &hash)
           }
           let hashString = hash.compactMap {
               return String(format: "%02x", $0)
           }.joined()
           
           return hashString
       }

}
