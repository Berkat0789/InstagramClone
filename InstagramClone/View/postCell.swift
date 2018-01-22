//
//  postCel.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/19/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class postCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var commentView: UIImageView!
    @IBOutlet weak var share: UIImageView!
    @IBOutlet weak var likeCount: UIButton!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var post: Post? {
        didSet {
            updateCell()
        }
    }

    
    
    func updateCell() {
        guard let imageString = post?.postURL else {return}
        postImage.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "photo2"))
        postCaption.text = post?.postCaption
        userName.text = "Berkat Bhatti"
        profileImage.image = UIImage(named: "photo2")
        
        getUserData()
       
    }//end update cell
    
    
    func getUserData() {
        guard let uid = post?.uid else {return}
        DataService.instance.getUserData(userID: uid) { (userName, profileImage) in
            self.userName.text = userName
            self.profileImage.sd_setImage(with: URL(string: profileImage), placeholderImage: UIImage(named: "photo2"))
        }
        
}//---end get user dada
   

}
