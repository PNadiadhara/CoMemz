//
//  ViewController.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/1/21.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
//        do {
//            try FirebaseAuth.Auth.auth().signOut()
//        } catch {
//            print("failed to sign out")
//        }
    }
    // check auth status
    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil {
            // display log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }


}

