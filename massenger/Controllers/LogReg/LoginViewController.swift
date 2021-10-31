//
//  ViewController.swift
//  massenger
//
//  Created by Ayman alsubhi on 21/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var UserNameTextFiled: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    
    
    @IBAction func LogInButton(_ sender: Any) {
        signInUser()
    }
    /*
  Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
        guard let result = authResult, error == nil else {
            print("Failed to log in user with email \(email)")
            return
        }
        let user = result.user
        print("logged in user: \(user)")
    }) */
    
    
    func signInUser() {
        Auth.auth().signIn(withEmail:UserNameTextFiled.text!, password: PassWordTextField.text!) { (authResult: AuthDataResult?, error: Error?) in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(error?.localizedDescription)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
        }
    }
    
    
    

    @IBAction func registerbutton(_ sender: Any) {
        
        performSegue(withIdentifier: "RegisterSegue", sender: sender)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

