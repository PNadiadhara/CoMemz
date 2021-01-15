//
//  ProfileTabsCollectionReusableView.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/10/21.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButton()
    func didTapTaggedButton()
}
struct Constants {
    static let padding: CGFloat = 8
}
class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        addSubview(gridButton)
        addSubview(taggedButton)
        
        gridButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        taggedButton.addTarget(self,
                               action: #selector(didTapTaggedButton),
                               for: .touchUpInside)
    }
    
    @objc private func didTapGridButton(){
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .lightGray
        delegate?.didTapGridButton()
    }
    
    @objc private func didTapTaggedButton(){
        taggedButton.tintColor = .systemBlue
        gridButton.tintColor = .lightGray 
        delegate?.didTapTaggedButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height - (Constants.padding * 2)
        let gridButtonXValue = ((width/2)-size)/2
        gridButton.frame =  CGRect(x: gridButtonXValue,
                                     y: 2,
                                     width: size,
                                     height: size)
        taggedButton.frame =  CGRect(x: gridButtonXValue + (width/2),
                                     y: 2,
                                     width: size,
                                     height: size)
    }
}
