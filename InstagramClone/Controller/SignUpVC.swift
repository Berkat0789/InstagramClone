//
//  SignUpVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class SignUpVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//--Outlets
    @IBOutlet weak var usernameTextfield: AuthTextfield!
    @IBOutlet weak var emailTextField: AuthTextfield!
    @IBOutlet weak var passWordTextField: AuthTextfield!
    @IBOutlet weak var userProfile: RoundedImage!
    
//--Variables and Arrrays
    //optional incase user doesnt add photo 
    var selectedProfileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaptoImageView()
    }
//--Protocol funcitons
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        userProfile.image = image
        selectedProfileImage = image
        dismiss(animated: true, completion: nil)
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
            if error != nil  {
                guard let errorMessage = AuthErrorCode(rawValue: error!._code) else {return}
                switch errorMessage {
                case .invalidEmail:
                    print("Invalid email")
                case .weakPassword:
                    print("Weak PAsssword")
                default:
                    print("Credantials does not meet requirements")
                }
            } else  {
                DataService.instance.adduserToFirebase(uid: (Auth.auth().currentUser?.uid)!, username: username, email: email, profileImg: self.selectedProfileImage!, userAdded: { (success) in
                    if success {
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let homeVC = storyboard.instantiateViewController(withIdentifier: "HometabBarID")
                        self.present(homeVC, animated: true, completion: nil)
                    }
                })
                
            }
        }
        
        
    }//end sign up pressed
    
//--Gestures and animations
    func addTaptoImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapToSelectImage(_:)))
        self.userProfile.addGestureRecognizer(tap)
        self.userProfile.isUserInteractionEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//--Selectors
    @objc func tapToSelectImage(_ recon: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

}//------end controller
