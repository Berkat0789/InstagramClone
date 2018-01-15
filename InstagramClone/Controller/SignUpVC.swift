//
//  SignUpVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase
class SignUpVC: UIViewController {
    @IBOutlet weak var usernameTextfield: AuthTextfield!
    @IBOutlet weak var emailTextField: AuthTextfield!
    @IBOutlet weak var passWordTextField: AuthTextfield!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//--Actions
    @IBAction func alreadyHavePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signupPressed(_ sender: Any) {
        guard let email = emailTextField.text, emailTextField.text != "" else {return}
        guard let password = passWordTextField.text, passWordTextField.text != "" else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }else {
                print(user)
            }
        }
    }//end sign up pressed
    
}
