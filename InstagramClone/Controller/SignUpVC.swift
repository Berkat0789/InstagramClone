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
        guard let username = usernameTextfield.text, usernameTextfield.text != "" else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }else {
                DataService.instance.adduserToFirebase(uid: (user?.uid)!, username: username, email: email, userAdded: { (Done) in
                    if Done {
                        //perform segue
                    }
                })
                
            }
        }
    }//end sign up pressed
    
}
