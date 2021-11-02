//
//  RegisterViewController.swift
//  massenger
//
//  Created by Ayman alsubhi on 22/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


class RegisterViewController: UIViewController   {

    @IBOutlet weak var imgeProfile: UIImageView!
    
    
    @IBOutlet weak var FirstNameTextfield: UITextField!

    @IBOutlet weak var LastNameTextfield: UITextField!
    
    @IBOutlet weak var EmailTextfield: UITextField!
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBAction func Register(_ sender: Any) {
        sigenUp()
        
    
    }

    @IBOutlet weak var checkLabel: UILabel!
    
    
    func sigenUp(){
        
        if FirstNameTextfield.text?.isEmpty == true {
            
            checkLabel.text = "please Enter First Name"
          return
        }
        if LastNameTextfield.text?.isEmpty == true {
            
            checkLabel.text = "please Enter Last Name"
          return
        }
        if EmailTextfield.text?.isEmpty == true {
            
            checkLabel.text = "please Enter Email"
          return
        }
        if PasswordTextfield.text?.isEmpty == true {
            
            checkLabel.text = "please Enter Password"
          return
        }

        FirebaseAuth.Auth.auth().createUser(withEmail: EmailTextfield.text!, password: PasswordTextfield.text!) { (authResult: AuthDataResult?, error: Error?) in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(error?.localizedDescription)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
        
            DatabaseManager.shared.storeDataToFirebase(fristName: self.FirstNameTextfield.text!, lastName: self.LastNameTextfield.text!)
            
        }
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "profile Id") else { return  }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ImgeButton(_ sender: Any) {
       
        profileActionSheet()
        
    }
    
    
    func profileActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [ weak self ] _ in
            self?.getPhotoFromCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.getPhotoFromLibrary()
            
        }))
        present(actionSheet, animated: true)
    }
    func getPhotoFromCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.isEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    
    func getPhotoFromLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.isEditing  = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
}
 extension RegisterViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
     
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
     {
         
         let editedImage = info[.originalImage] as! UIImage
    
         imgeProfile.image = editedImage
      dismiss(animated: true , completion: nil)
         
     }
     
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      dismiss(animated: true , completion: nil)
     }

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
}

   





















