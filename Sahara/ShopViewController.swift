//
//  ShopViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 11/23/21.
//

import UIKit

class ShopViewController: UIViewController {
    
    var shopImage:[String] = ["pcPic", "picturePC", "picturePC", "pcPic", "picturePC", "pcPic"]
    var shopsImage:[String] = ["picturePC", "pcPic", "pcPic", "pcPic", "picturePC", "pcPic"]
    var imageShop:[String] = ["pcPic", "picturePC", "picturePC", "pcPic", "pcPic", "pcPic"]

    @IBOutlet var shopCollectionView: UICollectionView!
    
    @IBOutlet var didChangeSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch didChangeSegment.selectedSegmentIndex {
        case 0:
            return shopImage.count
        case 1:
            return shopsImage.count
        case 2:
            return imageShop.count
        default:
            break
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! profileCollectionViewCell
        
        
        switch didChangeSegment.selectedSegmentIndex {
        case 0:
            cell.postImages.image = UIImage(named: shopImage[indexPath.row])
        case 1:
            cell.postImages.image = UIImage(named: shopsImage[indexPath.row])
        case 2:
            cell.postImages.image = UIImage(named: imageShop[indexPath.row])
        default:
            break
            
        }
        return cell
    }
    
    
    
}
