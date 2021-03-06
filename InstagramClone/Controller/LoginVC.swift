//
//  LoginVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
//--Outlets
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     addTaptodismissKetyboard()
    }//--end view did load
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toHomeVC", sender: nil)
        }
    }
    
//--Actions
    @IBAction func LoginPressed(_ sender: Any) {
        ProgressHUD.show("loading..", interaction: false)
        guard let email = emailtextField.text, emailtextField.text != "" else {return}
        guard let password = passwordTextField.text, passwordTextField.text != "" else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            ProgressHUD.show("working...", interaction: false)
            if error != nil {
//                print(error!.localizedDescription)
                ProgressHUD.showError("\(error!)")
            } else {
                ProgressHUD.showSuccess("Welcome Back to The Knight Market")
                self.performSegue(withIdentifier: "toHomeVC", sender: nil)
            }
        }
        
    }
//--Gestures and Animations
    func addTaptodismissKetyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//--Selectors
    @objc func dismisKeyboard(_ recon: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}//--End controller
