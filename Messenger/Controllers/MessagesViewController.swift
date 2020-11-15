//
//  MessagesViewController.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import UIKit
import FirebaseDatabase

class MessagesViewController: UIViewController {
    
    var currentUser: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        currentUser = defaults.string(forKey: "CurrentUser")!
        
    }
    

    

}
