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
        
        
        cell.messageLabel.text = "Message goes here"
        return cell
    }
    
    

}

extension MessagesViewController {
    //Database stuff
    
    func listenForNewMessage() {
        var myCount: Int = 0
        
        let messRef = ref.child("messages")
        messRef.observe(.value, with: {  snapshot in
            
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                print("\(myCount): \(rest.value!)")
                myCount += 1
            }
        })
        print(messageList)
        print("Number of indexes: \(messageList.count)")
    }
}
//snapshot.children
