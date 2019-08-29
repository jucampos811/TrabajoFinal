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
    var price: String?
    var stock: String?
    var type: String?
    var description: String?
    var image: String?
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshotValue["id"] as? String ?? ""
        price = snapshotValue["price"] as? String ?? ""
        stock = snapshotValue["stock"] as? String ?? ""
        type = snapshotValue["type"] as? String ?? ""
        description = snapshotValue["description"] as? String ?? ""
        image = snapshotValue["image"] as? String ?? ""
    }
    
    init(id: String, price: String, stock: String, type: String, description: String, image: String) {
        self.id = id
        self.price = price
        self.stock = stock
        self.type = type
        self.description = description
        self.image = image
    }
    
    func toAny() -> Any {
        return [
            "price" : price,
            "stock" : stock,
            "type" : type,
            "description" : description,
            "image" : image
        ]
    }
}
