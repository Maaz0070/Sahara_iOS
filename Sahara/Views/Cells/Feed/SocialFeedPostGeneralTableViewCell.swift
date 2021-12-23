//
//  SocialFeedPostGeneralTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 12/2/21.
//

import UIKit

//Comments
class SocialFeedPostGeneralTableViewCell: UITableViewCell {

    static let identifier = "SocialFeedPostGeneralTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
