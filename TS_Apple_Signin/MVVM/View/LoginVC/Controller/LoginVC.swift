//
//  ViewController.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 21/12/19.
//  Copyright © 2019 Gajalakshmi. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginVC: UIViewController {

    var backgroundImageView = UIImageView()
    var authorizationButton = ASAuthorizationAppleIDButton()
    
    var currentNonce        : String?
    var loginViewModel      : LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()

    }

}

