//
//  Comment.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/30/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation

class Comment {
    private(set) public var userImageURL: String!
    private(set) public var userName: String!
    private(set) public var Comment: String!

    init(userImageURL: String, name: String, comment: String) {
        self.userImageURL = userImageURL
        self.userName = name
        self.Comment = comment
    }
    
}
