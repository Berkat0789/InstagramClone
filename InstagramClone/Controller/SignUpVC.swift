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
class SignUpVC: UIViewController {
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
                DataService.instance.adduserToFirebase(uid: userID!, username: username, email: email, profileImg: self.selectedProfileImage!, userAdded: { (Good) in
                    if Good {
                        self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                    }
                })
                
            }
        }
    }//end sign up pressed
    
//--Gestures and animations
    func addTaptoImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToSelectImage(_:)))
        self.userProfile.addGestureRecognizer(tap)
        self.userProfile.isUserInteractionEnabled = true
    }
    
//--Selectors
    @objc func tapToSelectImage(_ recon: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

}//------end controller
//Need an extensiton for getting images from image library for firebase storage

extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {return}
        selectedProfileImage = image
        userProfile.image = image
        dismiss(animated: true, completion: nil)
    }
    
}
