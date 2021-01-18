//
//  ListViewController.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/14/21.
//

import UIKit

class ListViewController: UIViewController {

    private let data: [String]
    
    private let tableview: UITableView = {
        let tv = UITableView()
        tv.register(UserFollowTableViewCell.self,
                    forCellReuseIdentifier: UserFollowTableViewCell.identifier)
        return tv
    }()
    
    init(data: [String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier, for: indexPath) as! UserFollowTableViewCell
        cell.textLabel?.text = data[indexPath.row]
        cell.configure(with: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        // go to profile of cell
        let model = data[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
