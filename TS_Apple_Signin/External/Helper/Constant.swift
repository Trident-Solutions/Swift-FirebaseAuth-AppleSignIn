//
//  Constant.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 03/02/20.
//  Copyright © 2020 Gajalakshmi. All rights reserved.
//

import UIKit

enum AlertTitle : String {
    case AppName              = "TS_Apple_SignIn"
    case Success              = "Success"
    case Error                = "Error"
}

enum AlertMessage : String {
    case NotSignIn         = "NOT_READY_TO_SUBMIT"
    case AccountCreated    = "Your account has been successfully created"
   
}
enum CommonError : String {
    case EnctyptionError    = "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus "
    case TokenError         = "Unable to serialize token string from data :"
    case IdentifyTokenError = "Unable to fetch identity token"
    case InvalidStateError  = "Invalid state: A login callback was received, but no login request was sent."
}

enum Identifier : String {
    case apple = "apple.com"
}

enum Enctyption: String   {
    case randomString = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._"
}

enum ButtonText : String {
    case Okay = "Okay"
}

enum userDetails : String {
    case Identifier = "userIdentifier :"
    case FirstName = "userFirstName :"
    case LastName = "userLastName :"
    case Email = "userEmail :"

}



