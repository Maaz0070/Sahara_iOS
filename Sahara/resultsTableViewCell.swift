//
//  resultsTableViewCell.swift
//  Sahara
//
//  Created by Maaz Adil on 11/16/21.
//

import UIKit

var stars1:UIImageView = UIImageView()

class resultsTableViewCell: UITableViewCell {

    @IBOutlet weak var resultsView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var price: UILabel!
   // @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
   // @IBOutlet weak var ratingsImage: UIImageView!
    
    @IBOutlet var rating: UILabel!
    @IBOutlet var star1: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        price.numberOfLines = 0
        titleLabel?.numberOfLines = 0
        distance.numberOfLines = 0
      //  var starsy:[UIImageView] = [star1, star2, star3, star4, star5]
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! searchViewController
//        destinationVC.kstars = starsy
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


