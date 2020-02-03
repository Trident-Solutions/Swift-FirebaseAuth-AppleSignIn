//
//  LoginVC_Binding.swift
//  TS_Apple_Signin
//
//  Created by Gajalakshmi on 03/02/20.
//  Copyright © 2020 Gajalakshmi. All rights reserved.
//

import UIKit


extension LoginVC {
    
    func handleBinding() {
        
        if let model = loginViewModel {
            
            // Alert
            model.onShowAlert  = { [weak self] message in //AlertMessage.accountCreated
                
                let alertController = UIAlertController(title:AlertTitle.AppName.rawValue, message:message , preferredStyle: .alert)
                
                let action = UIAlertAction(title:ButtonText.Okay.rawValue , style: .cancel) { (action:UIAlertAction) in
                }
                alertController.addAction(action)
                self?.present(alertController,animated: true, completion: nil)
            }
            
        }
    }
}
