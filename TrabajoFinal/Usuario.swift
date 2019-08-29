//
//  Usuario.swift
//  TrabajoFinal
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import Foundation
import Firebase

struct User {
    var uid : String
    var name : String
    var lastname : String
    var age : Int
    var mail : String
    
    init(snapshot : DataSnapshot) {
        uid = snapshot.key
        let value = snapshot.value as! [String: AnyObject]
        name = value["name"] as? String ?? ""
        lastname = value["lastname"] as? String ?? ""
        age = value["age"] as? Int ?? 0
        mail = value["mail"] as? String ?? ""
    }
    
    init(name: String, lastname: String, age: Int, mail: String, uid: String) {
        self.name = name
        self.lastname = lastname
        self.age = age
        self.mail = mail
        self.uid = uid
    }
    
    func toAny() -> Any {
        return [
            "name" : name,
            "lastname" : lastname,
            "age" : age,
            "mail" : mail,
            "uid" : uid
        ]
    }
}

