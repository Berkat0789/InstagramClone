//
//  RoundedImage.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/15/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    func updateView() {
        self.layer.cornerRadius = self.layer.frame.width / 2
        self.clipsToBounds = true
    }
}
