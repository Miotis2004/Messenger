//
//  UserModel.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import Foundation

struct UserModel {
    var firstName: String
    var lastName: String
    var email: String
    
    var safeEmail: String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}

