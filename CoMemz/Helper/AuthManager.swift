//
//  AuthManager.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/2/21.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    
    public func registerNewUser(userName: String, email: String, password:String, completion: @escaping(Bool) -> Void){
        DatabaseManager.shared.canCreateNewUser(with: email, username: userName) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // firebase auth could not make an account
                        completion(false)
                        return
                    }
                    // insert account into FBDB
                    DatabaseManager.shared.insertNewUser(with: email, username: userName) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // failed to insert into db
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
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
