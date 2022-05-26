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
        

        print("1 - searchBarSearchButtonClicked")
            
        guard let btnTitle = searchQ.text else {
                print("2 - FAILED to get searchQ.largeContentTitle")
                return
            }
            
            print("2 - got btnTitle", btnTitle)
            
            if let tb = self.tabBarController {
                print("3 - got a tab bar controller reference")
                if let controllers = tb.viewControllers {
                    print("4 - got controllers reference")
                    print("4.5 - " + String(controllers.count))
                    if controllers.count == 5 {
                        print("5 - we have 5 controllers")
                        if let resultVC = controllers[3] as? searchViewController {
                            
                            
                            print("6 - got a reference to searchViewController")

                            // if we have not yet selected the 4th tab,
                            //    the view will not yet have been loaded
                            //    so make sure it is
                            resultVC.loadViewIfNeeded()
                            
                            // call the func, passing the button title
                            resultVC.doAthing(searchQ)
                            
                            // switch to the 4th tab
                            tb.selectedIndex = 3

                            print("7 - we should now be at searchViewController")
                            
                        } else {
                            print("6 - FAILED TO GET a reference to searchViewController")
                        }
                    } else {
                        print("5 - FAILED TO GET a reference to searchViewController")
                    }
                } else {
                    print("4 - FAILED TO GET a reference to searchViewController")
                }
            } else {
                print("3 - FAILED TO GET a reference to searchViewController")
            }
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
   


