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
    @IBOutlet weak var clearButton: UIBarButtonItem!
    
//--variables and arrays
    var selectedImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaptoImageView()
        postCaption.delegate = self
        clearButton.isEnabled = false


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
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearPostInput()
        handlePost()

    }
    
    
    @IBAction func sharepressed(_ sender: Any) {
        guard let caption = postCaption.text else {return}
        DataService.instance.AddPostToDB(userID: (Auth.auth().currentUser?.uid)!, postImage: selectedImage!, postCaption: caption) { (Success) in
            if Success {
                ProgressHUD.showSuccess("Post Added")
                self.clearPostInput()
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
        imageFolder.delegate = self
        present(imageFolder, animated: true, completion: nil)
    }
//--View function and handlers
    func handlePost() {
        if selectedImage != nil {
            clearButton.isEnabled = true
            shareButton.isHidden = false
            shareButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            clearButton.isEnabled = false
            shareButton.isHidden = true
            shareButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    func clearPostInput() {
        self.postCaption.text = "add caption here...."
        self.postImage.image = UIImage(named: "addImage")
        self.selectedImage = nil
    }
    
    
}//end class
