//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            FirebaseManager.createUser(email: email, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
                else {
                    if let receivedError = error {
                        let alertController = UIAlertController(title: "Error", message:
                            "\(receivedError.localizedDescription)", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                        print(receivedError)
                    }
                    //   SVProgressHUD.dismiss()
                }

            }
        }
        
    }
    
}
