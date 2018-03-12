//
//  commentVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/30/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class commentVC: UIViewController {
//-outlets
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaptoDismissKeyboard()

    }//--End view did laod
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

//Actions
    
    @IBAction func sendpressed(_ sender: Any) {
        guard let comment = commentField.text, commentField.text != "" else{return}
        DataService.instance.addCaptionToFirebase(userId: (Auth.auth().currentUser?.uid)!, commenttext: comment) { (Done) in
            if Done {
                
                self.commentField.text = ""
            } else {
                print("comment not posted")
            }
        }
    }//end send pressed
//--ggestures and animations
    func addTaptoDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(taptoDismissKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
//--Selectors
    @objc func taptoDismissKeyboard(_ Recon: UITapGestureRecognizer) {
        view.endEditing(true)
    }
//--Vuew update functions
    
}
