//
//  LoginViewController.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/1/21.
//

import UIKit

class LoginViewController: UIViewController {
// MARK: - UI Elements
    
    private let usernameEmailField: UITextField = {
       return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
       return UIButton()
    }()
    
    private let registerButton: UIButton = {
       return UIButton()
    }()
    
    private let TOSButton: UIButton = {
       return UIButton()
    }()
    
    private let privacyButton: UIButton = {
       return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
// MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(TOSButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapRegisterButton() {}
    
    @objc private func didTapTOSButton() {}
    
    @objc private func didTapPrivacyButton() {}


}
