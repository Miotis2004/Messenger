//
//  StartViewController.swift
//  Messenger
//
//  Created by Field Employee on 11/15/20.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
        
        if emailTextField.text == "", passwordTextField.text == "" {
            return
        }
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {[weak self] authResult, error in
            
            guard let self = self else {return}
            
            guard let result = authResult, error == nil else {
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                return
            }
            
        }
        let safeEmail = makeSafeEmail(user: emailTextField.text!)
        
        let defaults = UserDefaults.standard
        defaults.set(safeEmail, forKey: "CurrentUser")
        
        performSegue(withIdentifier: "MainSegue", sender: self)
        
    }
    
    func makeSafeEmail(user: String) -> String {
        var safeEmail: String {
            var safeEmail = user.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            return safeEmail
        }
        return safeEmail
    }

}
