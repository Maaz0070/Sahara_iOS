//
//  HomeViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/24/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
  
    
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var storesCollectionView: UICollectionView!
    
    @IBOutlet var searchQ: UISearchBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
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
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductCollectionViewCell
            cell.pillImage.image = UIImage(named: productsImages[indexPath.row])
            
            return cell
        }
    }
    
    
    
    var productsImages:[String] = ["pcPic", "picturePC"]
    var storesImages:[String] = ["newarkStore", "compeStore"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchQ.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.tabBar.isHidden = false
    }
    
    func searchBarSearchButtonClicked(_ searchQ: UISearchBar)
    {
        

        guard let btnTitle = searchQ.largeContentTitle else { return }

                // make sure we are in a tab bar controller
                // get its controllers
                // make sure there are 4 tabs
                // get the 4th tab as SearchViewController
            if let tb = self.tabBarController,
               let controllers = tb.viewControllers,
               controllers.count == 4,
               let resultVC = controllers[3] as? searchViewController {
                
                // if we have not yet selected the 4th tab,
                //    the view will not yet have been loaded
                //    so make sure it is
                resultVC.loadViewIfNeeded()
                
                // call the func, passing the button title
                resultVC.doAthing(searchQ)
                
                // switch to the 4th tab
                tb.selectedIndex = 3
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
