//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            FirebaseManager.login(email: email, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                    print("Log in successful!")
                }
                else {
                    if let receivedError = error {
                        let alertController = UIAlertController(title: "Error", message:
                            "\(receivedError.localizedDescription)", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                        print("Error occured while logging in.")
                    }
                }
                //  SVProgressHUD.dismiss()
            }
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.emailTextfield.text = ""
                self.passwordTextfield.text = ""
            }
        }
    }
    
    
}
