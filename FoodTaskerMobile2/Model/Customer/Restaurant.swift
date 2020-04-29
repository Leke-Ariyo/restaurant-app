//
//  Restaurant.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 16/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation
import SwiftyJSON

class Restaurant {
    
    var id: Int?
    var name: String?
    var address: String?
    var logo: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.name = json["name"].string
        self.address = json["address"].string
        self.logo = json["logo"].string
    }
}

