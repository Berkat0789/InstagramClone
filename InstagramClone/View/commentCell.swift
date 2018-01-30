//
//  commentCell.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/30/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import SDWebImage

class commentCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    func updateCell(comment: Comment) {
        guard let imageUrl = comment.userImageURL else {return}
        userImage.sd_setImage(with: URL(string:imageUrl), placeholderImage: UIImage(named: "userProfile"))
        userName.text = comment.userName
        commentLabel.text = comment.Comment
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
