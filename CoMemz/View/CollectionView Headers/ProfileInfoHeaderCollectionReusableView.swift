//
//  ProfileInfoHeaderCollectionReusableView.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/10/21.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowerButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
//MARK: - UI Elements
    private let profilePhotoImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Bio", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Place Holder"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let biographyLabel: UILabel = {
        let label = UILabel()
        label.text = "Place Holder bio text that wraps hopefully, but it may not though there is only one way to find out by reading this"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()

//MARK: - Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
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
    
    private func addButtonActions() {
        followersButton.addTarget(self,
                                  action: #selector(didTapFollowersButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postsButton.addTarget(self,
                                  action: #selector(didTapPostsButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self,
                                  action: #selector(didTapEditProfileButton),
                                  for: .touchUpInside)
    }
    
    @objc private func didTapFollowersButton(){
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    
    @objc private func didTapFollowingButton(){
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostsButton(){
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width - 10 - profilePhotoSize)/3
        let bioLabelSize = biographyLabel.sizeThatFits(frame.size)
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
        
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                         y: 5 + buttonHeight,
                                         width: countButtonWidth * 3,
                                         height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5 + profilePhotoImageView.bottom,
                                 width: width - 10,
                                 height: 50).integral
        
        biographyLabel.frame = CGRect(x: 5,
                                      y: 5 + nameLabel.bottom,
                                      width: width - 10,
                                      height: bioLabelSize.height).integral
        
        
        
    }
}

