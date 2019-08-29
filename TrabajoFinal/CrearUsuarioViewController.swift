//
//  CrearUsuarioViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CrearUsuarioViewController: UIViewController {

    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var passordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    
    @IBAction func crearUsuarioAccion(_ sender: Any) {
        guard let mail = correoTextField.text, !mail.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa el usuario", viewController: self)
            return
        }
        guard let pass = passordTextField.text, !pass.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa la contraseña", viewController: self)
            return
        }
        
        guard let name = nameTextField.text else {
            return
        }
        guard let lastname = lastnameTextField.text else {
            return
        }
        guard let age = ageTextfield.text else {
            return
        }
        

        
        
        SVProgressHUD.setForegroundColor(UIColor.red)
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: mail, password: pass) { (auth, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                AlertHelper().notificationAlert(title: "Error", message: "Ocurrió un error \(error.localizedDescription)", viewController: self)
                print(error.localizedDescription)
            }
            
            if let uid = auth?.user.uid {
             let user = User(name: name, lastname: lastname, age: Int(age)!, mail: mail, uid: uid)
             self.ref.child("users")
             .child(uid)
             .setValue(user.toAny())
            
            
            let alert = UIAlertController(title: "Exito", message: "El usuario ha sido creado correctamente", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel) { (ac) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            
            }
            
        }
        
    }
    
    
}
