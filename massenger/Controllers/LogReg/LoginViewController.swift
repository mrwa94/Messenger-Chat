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
    
    @IBOutlet weak var checkLable: UILabel!
    
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
        
        
        if UserNameTextFiled.text?.isEmpty == true{
            checkLable.text = "Please Enter username !"
            return
        }
        if PassWordTextField.text?.isEmpty == true {
            checkLable.text = "please Enter password !"
            
        }
        
        
        Auth.auth().signIn(withEmail:UserNameTextFiled.text!, password: PassWordTextField.text!) { (authResult: AuthDataResult?, error: Error?) in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(error?.localizedDescription)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = mainStoryboard.instantiateViewController(withIdentifier: "profileId") as! ProfileViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            //self.navigationController?.pushViewController(vc, animated: true)
               
            
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

