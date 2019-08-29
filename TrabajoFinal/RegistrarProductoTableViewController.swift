//
//  RegistrarProductoTableViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase

class RegistrarProductoTableViewController: UITableViewController {

    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var precioTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var stockTextField: UITextField!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }


    @IBAction func grabarAccion(_ sender: Any) {
        let product = Product(id: "", price: precioTextField.text!, stock: stockTextField.text!, type: tipoTextField.text!, description: descripcionTextField.text!, image: imageTextField.text!)
        ref.child("products").childByAutoId().setValue(product.toAny())
        //Alerta
        self.navigationController?.popViewController(animated: true)
    }
    
}
