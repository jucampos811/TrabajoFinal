//
//  ActualizarCuentaTableViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 28/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ActualizarCuentaTableViewController: UITableViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    var ref : DatabaseReference!
    
    var userUid : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getUserInfo()
    }
    
    func getUserInfo() {
        //SVProgressHUD
        //SVProgressHUD.setForegroundColor(UIColor.red)
        //SVProgressHUD.show()
        if let uid = UserDefaults.standard.object(forKey: "uid") as? String {
            self.userUid = uid
            ref.child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
                //SVProgressHUD.dismiss()
                let user = User(snapshot: snapshot)
                self.nameTextField.text = user.name
                self.lastnameTextField.text = user.lastname
                self.ageTextField.text = "\(user.age)"
                self.mailTextField.text = user.mail
            }
        }
    }
    
    @IBAction func actualizarAccion(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        guard let lastname = lastnameTextField.text else {
            return
        }
        guard let age = ageTextField.text else {
            return
        }
        guard let mail = mailTextField.text else {
            return
        }
        if let uid = userUid {
            let user = User(name: name, lastname: lastname, age: Int(age)!, mail: mail, uid: uid)
            //Actualizar la información
            ref.child("users").child(uid).setValue(user.toAny())
        }
        
        let alert = UIAlertController(title: "Exito", message: "El usuario ha sido actualizado correctamente", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (ac) in
            //self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }

}
