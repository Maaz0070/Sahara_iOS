//
//  PostTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 11/26/21.
//
/*

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    
    static let identifier = "PostTableViewCell"
    
    static func nib() ->UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: InstagramPost) {
        self.likeLabel.text = "\(model.numberOfLikes) Likes"
        self.usernameLabel.text = model.username
        self.userImageView.image = UIImage(named: model.userImageName)
        self.postImageView.image = UIImage(named: model.postImageName)
        
    }
    
}
*/
