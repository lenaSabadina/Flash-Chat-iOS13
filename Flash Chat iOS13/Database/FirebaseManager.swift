//
//  FirebaseManager.swift
//  Flash Chat iOS13
//
//  Created by Lena Sabadina on 2019-11-18.
//  Copyright © 2019 Whiskerz AB. All rights reserved.
//

import Foundation
import Firebase

struct FirebaseManager {
    
    static func configure() {
        FirebaseApp.configure()
    }
    
    static func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
           
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
               completion(user, error)

            }
        }
}
