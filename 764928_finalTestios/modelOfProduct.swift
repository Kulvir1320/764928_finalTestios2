//
//  modelOfProduct.swift
//  764928_finalTestios
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Product {
    internal init(id: Int, name: String, description: String, price: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
    }
    
    var id: Int
    var name: String
    var description: String
    var price: Double
    
   static var product = [Product]()
}
