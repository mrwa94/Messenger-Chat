//
//  ProfileViewController.swift
//  massenger
//
//  Created by marwa alsubhi on 22/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBAction func LogOutButton(_ sender: Any) {
        LogOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    func LogOut(){
        
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
         
    }

}
