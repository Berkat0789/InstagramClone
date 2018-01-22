//
//  User.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/21/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation

class User {
    
    private(set) public var userEmail: String!
    private(set) public var username: String!
    private(set) public var profileImgURL: String!

    init(email: String, username: String, profileImg: String) {
        self.userEmail = email
        self.username = username
        self.profileImgURL = profileImg
    }
    
    
}
