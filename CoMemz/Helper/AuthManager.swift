//
//  AuthManager.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/2/21.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    
    public func registerNewUser(userName: String, email: String, password:String){
        
    }
    
    public func loginUser(userName: String?, email: String?, password: String, completion: @escaping(Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = userName {
            
        }
    }
}
