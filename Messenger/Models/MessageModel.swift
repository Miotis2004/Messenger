//
//  MessageModel.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import Foundation

struct MessageModel: Codable {
    var userSending: String
    var userReceiving: String
    var message: String
    
}
