//
//  Constants.swift
//  InstagramClone
//
//  Created by berkat bhatti on 1/16/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import Firebase

//--User Constants
let userID = Auth.auth().currentUser?.uid

//--Completion Hander

typealias downloadComplete = (_ status: Bool) -> ()
