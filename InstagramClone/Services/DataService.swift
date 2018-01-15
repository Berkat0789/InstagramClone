//
//  DataService.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import Firebase

let DB_Reference = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private(set) public var DB_REFERENCE = DB_Reference
    private(set) public var DB_REFERENCE_users = DB_Reference.child("user")

    func adduserToFirebase(uid: String, username: String, email: String, userAdded: @escaping (_ status: Bool) -> ()) {
        DB_REFERENCE_users.child(uid).updateChildValues(["email": email, "username": username])
        userAdded(true)
    }
    
}
