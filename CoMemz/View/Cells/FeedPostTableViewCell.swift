//
//  FeedPostTableViewCell.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/6/21.
//

import UIKit

final class FeedPostTableViewCell: UITableViewCell {

    static let identifier = "FeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
    }
}
