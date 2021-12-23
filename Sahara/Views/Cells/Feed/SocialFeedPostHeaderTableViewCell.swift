//
//  SocialFeedPostHeaderTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 12/2/21.
//

import SDWebImage
import UIKit

protocol SocialFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

class SocialFeedPostHeaderTableViewCell: UITableViewCell {
    
    weak var delegate: SocialFeedPostHeaderTableViewCellDelegate?

    static let identifier = "SocialFeedPostHeaderTableViewCell"
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self,
                             action: #selector(didTapButton),
                             for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        delegate?.didTapMoreButton()
    }
    
    public func configure(with model:  User) {
        usernameLabel.text = model.username
        profilePhotoImageView.image = UIImage(systemName: "person.circle")
        
        
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = contentView.bounds.height-4
        profilePhotoImageView.frame = CGRect(x: 2, y: 2, width: size, height: size)
        profilePhotoImageView.layer.cornerRadius = size/2
        
        moreButton.frame = CGRect(x: contentView.bounds.width-size, y: 2, width: size, height: size)
        usernameLabel.frame = CGRect(x: profilePhotoImageView.bounds.maxX + 15,
                                     y: 2,
                                     width: contentView.bounds.width-(size*2)-15,
                                     height: contentView.bounds.height-4)
        
        
    }
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernameLabel.text = nil
        profilePhotoImageView.image = nil
    }
}


