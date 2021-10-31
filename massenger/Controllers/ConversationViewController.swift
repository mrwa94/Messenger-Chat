//
//  ConversationViewController.swift
//  massenger
//
//  Created by Ayman alsubhi on 22/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
        try FirebaseAuth.Auth.auth().signOut()
               }
               catch {
               }
        databasemaneger.shared.test()
           }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
     
    
    private func validateAuth(){
           // current user is set automatically when you log a user in
           if FirebaseAuth.Auth.auth().currentUser == nil {
               // present login view controller
               let vc = LoginViewController()
               let nav = UINavigationController(rootViewController: vc)
               nav.modalPresentationStyle = .fullScreen
               present(nav, animated: false)
           }
    }
    
    

    

}
