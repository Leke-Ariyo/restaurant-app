//
//  Meal.swift
//  FoodTaskerMobile2
//
//  Created by MacBook on 17/04/2020.
//  Copyright © 2020 MacBook. All rights reserved.
//


import Foundation
import SwiftyJSON

class Meal {

    var id: Int?
    var name: String?
    var short_description: String?
    var image: String?
    var price: Float?
    
    init(json: JSON) {
        
        self.id = json["id"].int
        self.name = json["name"].string
        self.short_description = json["short_description"].string
        self.image = json["image"].string
        self.price = json["price"].float
    }
}

