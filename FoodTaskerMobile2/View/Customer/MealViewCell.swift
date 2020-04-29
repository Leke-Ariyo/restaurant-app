//
//  MealViewCell.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 17/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {
    @IBOutlet weak var lbMealName: UILabel!
    
    @IBOutlet weak var lbMealShortDescription: UILabel!
    @IBOutlet weak var lbMealPrice: UILabel!
    @IBOutlet weak var imgMealImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
