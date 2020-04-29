//
//  DriverMenuViewController.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 18/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class DriverMenuViewController: UITableViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbName.text = User.currentUser.name
        imgAvatar.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        imgAvatar.layer.cornerRadius = 70 / 2
        imgAvatar.layer.borderWidth = 1.0
        imgAvatar.layer.borderColor = UIColor.white.cgColor
        imgAvatar.clipsToBounds = true
        view.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha:1)
    }

}
