//
//  PhotoCollectionViewCell.swift
//  CoMemz
//
//  Created by Pritesh Nadiadhara on 1/10/21.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground 
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UserPost){
        let thumbnailURL = model.thumbnailImage
        photoImageView.sd_setImage(with: thumbnailURL, completed: nil)
    }
    
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
}
