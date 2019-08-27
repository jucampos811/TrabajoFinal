//
//  Producto.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import Foundation
import Firebase


struct Product {
    var id: String?
    var price: Int?
    var stock: Int?
    var type: String?
    var description: String?
    var image: String?
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshotValue["id"] as? String ?? ""
        price = snapshotValue["price"] as? Int ?? 0
        stock = snapshotValue["stock"] as? Int ?? 0
        type = snapshotValue["type"] as? String ?? ""
        description = snapshotValue["description"] as? String ?? ""
        image = snapshotValue["image"] as? String ?? ""
    }
    
    init(id: String, price: Int, stock: Int, type: String, description: String, image: String) {
        self.id = id
        self.price = price
        self.stock = stock
        self.type = type
        self.description = description
        self.image = image
    }
}
