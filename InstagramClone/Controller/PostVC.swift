//
//  PostVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
//--Outlets
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCaption: UITextView!
    @IBOutlet weak var shareButton: UIButton!
//--variables and arrays
    var selectedImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaptoImageView()
        postCaption.delegate = self

    }//--End view did load
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handlePost()
    }
//--Protocol Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {return}
        postImage.image = image
        selectedImage = image
        dismiss(animated: true, completion: nil)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        postCaption.text = ""
    }
    
//--Actions
    @IBAction func sharepressed(_ sender: Any) {
        guard let caption = postCaption.text else {
            ProgressHUD.showError("Caption cannot be blank")
            return
        }
        DataService.instance.AddPostToDB(userID: (Auth.auth().currentUser?.uid)!, postImage: selectedImage!, postCaption: caption) { (Success) in
            if Success {
                ProgressHUD.showSuccess("Post Added")
                self.postCaption.text = "Add Caption...."
                self.postImage.image = UIImage(named: "user_profile")
                self.selectedImage = nil
                self.tabBarController?.selectedIndex = 0
                
            } else {
                ProgressHUD.showError("Post Was not added")
            }
        }
        
    }
//-gestures and animations
    
    func addTaptoImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapToopenImageSelection(_:)))
        self.postImage.addGestureRecognizer(tap)
        self.postImage.isUserInteractionEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
//--Selectors
    @objc func tapToopenImageSelection(_ recon: UITapGestureRecognizer) {
        let imageFolder = UIImagePickerController()
        imageFolder.delegate  = self
        present(imageFolder, animated: true, completion: nil)
    }
//--View function and handlers
    func handlePost () {
        if selectedImage == nil {
            shareButton.isEnabled = false
            self.shareButton.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }else {
            shareButton.isEnabled = true
            self.shareButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

        }
    }
    
    
    
}//end class
