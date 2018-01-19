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
let DB_StorageRef = Storage.storage().reference()

class DataService {
    static let instance = DataService()
    
    private(set) public var DB_REFERENCE = DB_Reference
    private(set) public var DB_REFERENCE_users = DB_Reference.child("user")
    private(set) public var DB_REFERENCE_posts = DB_Reference.child("post")


//--Storage Referemce
    private(set) public var DB_Storage_REF = DB_StorageRef
    private(set) public var DB_Storage_REF_profileImage = DB_StorageRef.child("profileImages")
    private(set) public var DB_Storage_REF_PostImage = DB_StorageRef.child("postimages")

    
    func adduserToFirebase(uid: String, username: String, email: String, profileImg: UIImage, userAdded: @escaping (_ status: Bool) -> ()) {
    //--converts all images to jpg format
        let imageData = UIImageJPEGRepresentation(profileImg, 0.1)
        DB_Storage_REF_profileImage.putData(imageData!, metadata: nil) { (metaData, error) in
            if error != nil {
                return
            } else {
            //--converts image to UrL
                let profilePicURL = metaData?.downloadURL()?.absoluteString
                self.DB_REFERENCE_users.child(uid).updateChildValues(["email": email, "username": username, "profileImg" : profilePicURL!])
            }
        }
        userAdded(true)
    }//--end add user
    
//--Add post
    
    func AddPostToDB(userID: String, postImage: UIImage, postCaption: String, completed: @escaping downloadComplete) {
        let postImg = UIImageJPEGRepresentation(postImage, 0.1)
        DB_Storage_REF_PostImage.putData(postImg!, metadata: nil) { (metaData, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let image = metaData?.downloadURL()?.absoluteString
                self.DB_REFERENCE_posts.childByAutoId().updateChildValues(["postImage": image!, "postCaption" :postCaption, "userID": userID])
            }
        }
        completed(true)
        
    }//end add post


    
}//--end class
