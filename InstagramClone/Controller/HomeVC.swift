//
//  HomeVC.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//--End view did load
    
//--Actions
    
    @IBAction func LogoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch let error as NSError {
            print(error)
        }
        
        let storyboard = UIStoryboard(name: "Start", bundle: nil)
        let LoginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        present(LoginVC, animated: true, completion: nil)
        
    }//end logout pressed
    
}//End controller
