//
//  OrderViewCell.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 18/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class OrderViewCell: UITableViewCell {

    @IBOutlet weak var lbQty: UILabel!
    @IBOutlet weak var lbMealName: UILabel!
    @IBOutlet weak var lbSubTotal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
