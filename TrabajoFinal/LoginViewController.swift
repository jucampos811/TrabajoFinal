//
//  LoginViewController.swift
//  TrabajoFinal
//
//  Created by Alumno on 26/08/19.
//  Copyright © 2019 Area51 Training Center SAC. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var passordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAcceso(_ sender: Any) {
        //validaciones
        guard let mail = correoTextField.text, !mail.isEmpty else {
            //Alerta
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa tu usuario", viewController: self)
            return
        }
        guard let pass = passordTextField.text, !pass.isEmpty else {
            AlertHelper().notificationAlert(title: "Alerta", message: "Ingresa tu contraseña", viewController: self)
            return
        }
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: mail, password: pass) { (auth, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                print(error.localizedDescription)
                AlertHelper().notificationAlert(title: "Error", message: "Ocurrió un error \(error.localizedDescription)", viewController: self)
            }
            //Se verifico el logeo
            //Se direcciona a la siguiente vista (Lista de productos de deportes)
            if let uid = auth?.user.uid {
                UserDefaults.standard.set(uid, forKey: "uid")
                UserDefaults.standard.synchronize()
            }
           
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let controller = stb.instantiateViewController(withIdentifier: "tarBarProdDeporte")
            self.present(controller, animated: true, completion: nil)
        }
        
    }
    
}
