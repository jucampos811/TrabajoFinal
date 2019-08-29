//
//  RegistrarUsuarioTableViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase

class RegistrarUsuarioTableViewController: UITableViewController {

    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
}
