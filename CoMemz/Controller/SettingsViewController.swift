//
//  SettingsViewController.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/1/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let tableview: UITableView = {
        let tableview = UITableView(frame: .zero,
                                    style: .grouped)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableview)
        configureModels()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
        
    }
// MARK: - Settings Views Sections
    private func configureModels() {
        let logOutSection = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
                
            }
        ]
        
        let userSection = [
            SettingCellModel(title: "Edit Profile") { [weak self] in
                self?.didTapEditProfile()
                
            },
            SettingCellModel(title: "Invite Friends") { [weak self] in
                self?.didTapInviteFriends()
                
            },
            SettingCellModel(title: "Save Original Post") { [weak self] in
                self?.didTapSaveOriginalPost()
                
            }
            
        ]
        
        let policySection = [
            SettingCellModel(title: "Terms of Service") { [weak self] in
                self?.didTapTOS()
                
            },
            SettingCellModel(title: "Privacy Policy") { [weak self] in
                self?.didTapPrivacyPolicy()
                
            },
            SettingCellModel(title: "Help / Feedback") { [weak self] in
                self?.didTapHelpFeedback()
                
            }
            
        ]
        
        
        data.append(contentsOf: [userSection, policySection, logOutSection])
    }
// MARK: - Settings View Tap Functions
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Confirm Log Out",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            AuthManager.shared.logOut { success in
                DispatchQueue.main.async {
                    if success {
                        // display log in
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        fatalError("User Could Not Be Logged Out")
                    }
                }
            }
            
            
        }))
        // iPad Configuration
        actionSheet.popoverPresentationController?.sourceView = tableview
        actionSheet.popoverPresentationController?.sourceRect = tableview.bounds
        present(actionSheet, animated: true)
    }
    
    private func didTapEditProfile(){
        
    }
    
    private func didTapInviteFriends(){
        
    }

    private func didTapSaveOriginalPost(){
        
    }
    
    private func didTapTOS(){
        
    }
    
    private func didTapPrivacyPolicy(){
        
    }
    
    private func didTapHelpFeedback(){
        
    }
    
    
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        // this will invoke the sections handler i.e. logout set up on line 38
        data[indexPath.section][indexPath.row].handler()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
}
