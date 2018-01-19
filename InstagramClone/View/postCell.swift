//
//  postCel.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/19/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
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
    
    func updateCell(post: Post) {
        guard let imageString = post.postURL else {return}
//        let imageURl = URL(string: imageString)
        postImage.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "photo2"))

        postCaption.text = post.postCaption
        userName.text = "Berkat Bhatti"
        profileImage.image = UIImage(named: "photo2")
    }

}
