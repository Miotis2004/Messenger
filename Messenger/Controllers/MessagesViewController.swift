//
//  MessagesViewController.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import UIKit
import FirebaseDatabase

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var currentUser: String = ""
    var messageList:[MessageModel] = []
    var messagesRead: Bool = false
    
    //Database
    var ref = Database.database().reference()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MessageCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MessageCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let defaults = UserDefaults.standard
        currentUser = defaults.string(forKey: "CurrentUser")!
        
        listenForNewMessage()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        
        
        cell.messageLabel.text = messageList[indexPath.row].message
        return cell
    }
    
    

}

extension MessagesViewController {
    //Database stuff
    
    func listenForNewMessage() {
        let messRef = ref.child("messages")
        
        messRef.observe(.value, with: { [self]snapshot in
            guard let value = snapshot.value as? [String: Any] else {return}
            guard let userReceiving = value["userReceiving"] as? String,
                  let userSending = value["userSending"] as? String,
                  let message = value["message"] as? String
            else {return}
            
            let newMessage = MessageModel(userSending: userSending, userReceiving: userReceiving, message: message)
            
            print("New Message: \(newMessage)")
            
            messageList.append(newMessage)
        })
        print(messageList)
        print("Number of indexes: \(messageList.count)")
    }
}
