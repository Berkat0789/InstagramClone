//
//  Post.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/19/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
class Post{
    private(set) public var postURL: String!
    private(set) public var postCaption: String!

    init(postUrL: String, postCaption: String) {
        self.postCaption = postCaption
        self.postURL = postUrL
    }
}//end class 
