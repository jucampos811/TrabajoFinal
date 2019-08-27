//
//  ViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ViewController: UIViewController{
    //
    var products = [Product]()
    var ref : DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.productTableView.delegate = self
//        self.productTableView.dataSource = self
//        ref = Database.database().reference()
//        SVProgressHUD.setForegroundColor(UIColor.orange)
//        SVProgressHUD.show()
//        ref.child("products").observeSingleEvent(of: .value) { (snapshot) in
//            SVProgressHUD.dismiss()
//            for child in snapshot.children.allObjects as! [DataSnapshot] {
//                let product = Product(snapshot: child)
//                self.products.append(product)
//            }
//            self.productTableView.reloadData()
//        }
//    }

    
    

}

}
