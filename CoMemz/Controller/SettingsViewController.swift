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
    
    private func configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
                
            }
        ]
        data.append(section)
    }
    
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
    
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
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
