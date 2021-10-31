//
//  DatabaseManager.swift
//  massenger
//
//  Created by Ayman alsubhi on 25/03/1443 AH.
//

import Foundation
import FirebaseDatabase

final  class databasemaneger {
     static let shared = databasemaneger()
    private let  database = Database.database().reference()  // reference the database
    
    
    func test() {

        database.child("foo").setValue(["something": true])
        
    }
    
}

struct ChatAppUser {
    
 let fristName: String
 let lastName: String
 let emailAddress: String
   


var safeEmail : String {
    var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
           safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
           return safeEmail
    
}
}


extension databasemaneger {
    
    public func  userExists (with email: String , completion: @escaping((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
              
              database.child(safeEmail).observeSingleEvent(of: .value) { snapshot in
                  // snapshot has a value property that can be optional if it doesn't exist
                  
                  guard snapshot.value as? String != nil else {
                      // otherwise... let's create the account
                      completion(false)
                      return
                  }
                  
                  // if we are able to do this, that means the email exists already!
                  
                  completion(true)
                  
              }
        
}

    public func insertUser(with user: ChatAppUser){
          
        database.child(user.safeEmail).setValue(["first_name":user.fristName,"last_name":user.lastName]
          )
      }
}












