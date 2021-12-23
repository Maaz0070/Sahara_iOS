//
//  SocialTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 12/1/21.
//

import SDWebImage
import UIKit
import AVFoundation


///Cell for primary post content
class SocialTableViewCell: UITableViewCell {
    
    static let identifier = "SocialTableViewCell"
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = nil
        return imageView
    }()

    private var player: AVPlayer?
    private var playerLayer = AVPlayerLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with post: UserPost) {
        postImageView.image = UIImage(named: "nightSky")
        
        return
        
        //configure the cell
        switch post.postType {
        case .photo:
            //show image
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        case .video:
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
            //load and play videe
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
        
        postImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
}
