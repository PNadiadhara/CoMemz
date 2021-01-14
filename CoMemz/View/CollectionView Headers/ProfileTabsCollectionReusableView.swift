//
//  ProfileTabsCollectionReusableView.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/10/21.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
