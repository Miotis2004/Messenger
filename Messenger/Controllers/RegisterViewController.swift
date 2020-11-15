//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        if firstNameTextField.text == "", lastNameTextField.text == "", emailTextField.text == "" {
            return
        }
        
        let newUser: UserModel = UserModel(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)
        
        createUser()
        
        ref = Database.database().reference()

        
        self.ref.child("users").child(newUser.safeEmail).setValue(["firstName": newUser.firstName, "lastName": newUser.lastName, "email": newUser.email])
        
        self.dismiss(animated: true, completion: nil)

    }
    
    public func createUser() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            if error != nil {
                print("error registering user")
                return
            }
            
            
        }

    }


}
