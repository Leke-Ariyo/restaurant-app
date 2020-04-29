//
//  CustomerMenuTableViewController.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 13/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class CustomerMenuTableViewController: UITableViewController {
    let activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var ImgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Helpers.showActivityIndicator(activityIndicator, view)
        lbName.text = User.currentUser.name
        ImgAvatar.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        ImgAvatar.layer.cornerRadius = 70 / 2
        ImgAvatar.layer.borderWidth = 1.0
        ImgAvatar.layer.borderColor = UIColor.white.cgColor
        ImgAvatar.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha:1)
        Helpers.hideActivityIndicator(self.activityIndicator)
    }
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        if identifier == "CustomerLogout" {
//            APIManager.shared.logout(completionHandler: { (error) in
//
//                if error == nil {
//                    FBManager.shared.logOut()
//                    User.currentUser.resetInfo()
//                    // Re-render the LoginView once you completed your loggin out process
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
////                    let appController = storyboard.instantiateViewController(withIdentifier: "MainController") as! LoginViewController
//                    let appController = storyboard.instantiateViewController(withIdentifier: "MainController") as! LoginViewController
//                    let appDelegate = UIApplication.shared.delegate as! SceneDelegate
//                    appDelegate.window!.rootViewController = appController
//                }
//            })
//
//            return false
//
//
//        }
//
//        return true
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CustomerLogout" {
            
            APIManager.shared.logout(completionHandler: { (error) in
                
                if error == nil {
                    FBManager.shared.logOut()
                    User.currentUser.resetInfo()
                    
                    // Re-render the LoginView once you completed your loggin out process
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let appController = storyboard.instantiateViewController(withIdentifier: "MainController") as! LoginViewController
                    
//                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                    appDelegate.window!.rootViewController = appController
                }
            })
            
            
        }
    }
}

