//
//  ProductTableViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase

class ProductTableViewController: UITableViewController {

    var products = [Product]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getProducts()
    }
    
    func getProducts() {
        ref.child("products").observeSingleEvent(of: .value) { (snapshot) in
            self.products = []
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let product = Product(snapshot: child)
                self.products.append(product)
            }
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productIDFut", for: indexPath) as! ProductTableViewCell
        cell.product = self.products[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
