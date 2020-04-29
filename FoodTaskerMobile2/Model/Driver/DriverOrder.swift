//
//  DriverOrder.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 18/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import SwiftyJSON

class DriverOrder {
    
    var id: Int?
    var customerName: String?
    var customerAddress: String?
    var customerAvatar: String?
    var restaurantName: String?
    
    init(json: JSON) {
        
        self.id = json["id"].int
        self.customerName = json["customer"]["name"].string
        self.customerAddress = json["address"].string
        self.customerAvatar = json["customer"]["avatar"].string
        self.restaurantName = json["restaurant"]["name"].string
    }
}
