//
//  DriverOrderCell.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 18/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class DriverOrderCell: UITableViewCell {

    @IBOutlet weak var lbRestaurantName: UILabel!
    @IBOutlet weak var imgCustomerAvatar: UIImageView!
    @IBOutlet weak var lbCustomerName: UILabel!
    @IBOutlet weak var lbCustomerAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
