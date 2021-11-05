//
//  HomeViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/24/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var storesCollectionView: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == storesCollectionView) {
                return storesImages.count
            }
            return productsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if(collectionView == storesCollectionView) {
            let cell2 = storesCollectionView.dequeueReusableCell(withReuseIdentifier: "storesCell", for: indexPath) as! StoreCollectionViewCell
            cell2.compstoreImage.image = UIImage(named: storesImages[indexPath.row])
            
            return cell2
        }
        else{
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! productCollectionViewCell
            cell.pillImage.image = UIImage(named: productsImages[indexPath.row])
            
            return cell
        }
    }
    
    
    var productsImages:[String] = ["pcPic", "picturePC"]
    var storesImages:[String] = ["newarkStore", "compeStore"]

    

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
