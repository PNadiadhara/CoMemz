//
//  ProfileInfoHeaderCollectionReusableView.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/10/21.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView: UIImageView = {
        let iv = UIImageView()
        
        return iv
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let biographyLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(biographyLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width/4
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = width - 10 - profilePhotoSize
        
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight).integral
        
        followersButton.frame = CGRect(x: postsButton.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight).integral
        
        followingButton.frame = CGRect(x: followersButton.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight).integral
        
        
    }
}
