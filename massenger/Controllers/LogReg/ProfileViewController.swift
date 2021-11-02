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
    
    var data = ["Log Out"]

    @IBOutlet weak var tableview: UITableView!
    @IBAction func LogOutButton(_ sender: Any) {
        
        LogOut()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func LogOut(){
        
            let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            alert.addAction((UIAlertAction(title: "LogOut", style: .destructive, handler: { [weak self] _ in
              
                           
                     guard let self = self else {return}
                            
                    
                           do {
                               try FirebaseAuth.Auth.auth().signOut()
                               let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = mainStoryboard.instantiateViewController(withIdentifier: "login ID") as! LoginViewController
                               vc.modalPresentationStyle = .fullScreen
                               self.present(vc, animated: true, completion: nil)
                               }
                        
                         catch {
                         print("failed to logout")
                             
                }

            })))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated:true, completion: nil)
            
            //guard let vc = storyboard?.instantiateViewController(withIdentifier: "login ID") else { return  }
          //  self.navigationController?.pushViewController(vc, animated: true)
      
    }

}

extension ProfileViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
  

    
}














