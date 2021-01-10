//
//  EditProfileViewController.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/1/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(FormTableViewCell.self,
                           forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableview
    }()
    
    private var models = [[EditProfileCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        
        view.addSubview(tableView)

        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    //MARK: - Functions
    
    @objc private func didTapSave(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture(){
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Pick Photo", style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
     
        //iPad additions
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
 
    
    func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/4).integral)
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width-size)/2,
                                                        y: (header.height-size)/2,
                                                        width: size,
                                                        height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self,
                                     action: #selector(didTapChangeProfilePicture),
                                     for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                              for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    private func configureModels() {
        let section1Labels = ["Name", "UserName", "Bio"]
        var section1 = [EditProfileCellModel]()
        for label in section1Labels {
            let model = EditProfileCellModel(label: label,
                                             placeholder: "Enter \(label)",
                                             value: nil)
            section1.append(model)
        }
        
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileCellModel]()
        for label in section2Labels {
            let model = EditProfileCellModel(label: label,
                                             placeholder: "Enter \(label)",
                                             value: nil)
            section2.append(model)
        }
        
        models.append(contentsOf: [section1, section2])
    }

}
//MARK: - TableView Datasource
extension EditProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Informaiton"
    }
    
    
}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updateModel: EditProfileCellModel?) {
        print(updateModel?.value ?? "nil")
    }
        
    
    
    
}
