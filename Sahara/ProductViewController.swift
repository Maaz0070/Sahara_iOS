//
//  ProductViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 1/10/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var likes: UILabel!
    @IBOutlet var payment1: UIImageView!
    @IBOutlet var payment2: UIImageView!
    @IBOutlet var payment3: UIImageView!
    @IBOutlet var desc: UILabel!
    
    
    var ktitle:String = ""
    var kprice:Int = 0
    var kimage = UIImage()
    var kdescription:String = ""
    var klikes:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.frame.size.height = view.frame.height + 100
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height+500)
        titleLabel.text = ktitle
        productImage.image = kimage
        productPrice.text = String(kprice)
        likes.text = String(klikes)
        
    //for testing profuct should come from searchViewController
        let product = Product(title: "PC",
                              price: 400,
                              likes: 24,
                              condition: "like new",
                              Brand: "N/A",
                              Category: "Computers & Electronics",
                              Description: "Recently build custom PC. Powerful for gaming needs",
                              location: "Silicon Valley, CA",
                              paymentMethods: ["cash", "bitcoin", "card"],
                              tags: ["#computer", "pc", "custom", "build", "gaming"]
                             )
        
        desc.text = product.Description
        desc.numberOfLines = 0
        
        if(product.paymentMethods.contains("cash") && !product.paymentMethods.contains("bitcoin"))
        {
            payment1.image = UIImage(named: "Webp.net-resizeimage (15)")
            payment2.image = UIImage(named: "")
        }
        else if(product.paymentMethods.contains("bitcoin") && product.paymentMethods.contains("cash"))
        {
            payment1.image = UIImage(named: "Webp.net-resizeimage (15)")
            payment2.image = UIImage(named: "bitcoinLogo")
            
        }
        else
        {
            payment1.image = UIImage(named: "bitcoinLogo")
            payment2.image = UIImage(named: "")
        }
        
        if(product.paymentMethods.contains("card"))
        {
            payment3.image = UIImage(named: "cardPic")
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
