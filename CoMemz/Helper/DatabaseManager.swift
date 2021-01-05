//
//  DatabaseManager.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/2/21.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    
    /// Check if username and email are avaiable to make account
    /// - Parameters
    ///     - email: String represents email
    ///     - username: String, represents username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    /// Insert newly created user into Firebase Database
    /// - Parameters
    ///     - email: String represents email
    ///     - username: String, represents username
    ///     - completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username" : username]) { error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                completion(false)
                return
            }
        }
    }
    
    
}
