//
//  FBManager.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 14/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON

class FBManager {
    
    static let shared = LoginManager()
    
    public class func getFBUserData(completionHandler: @escaping () -> Void) {
        
        if (AccessToken.current != nil) {
            let rs = AccessToken.current?.tokenString ?? ""
                        GraphRequest(graphPath: "me", parameters: ["fields": "name, email, picture.type(normal)"]).start(completionHandler: { (connection, result, error) in
                
                if (error == nil) {
                    
                    let json = JSON(result!)
                    //print(json)
                    
                    User.currentUser.setInfo(json: json)
                    
                    completionHandler()
                }
            })
        }
    }
}

