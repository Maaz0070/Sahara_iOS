//
//  resultsTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 11/16/21.
//

import UIKit

class resultsTableViewCell: UITableViewCell {

    @IBOutlet weak var resultsView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var ratingsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
