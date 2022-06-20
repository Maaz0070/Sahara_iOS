//
//  HomeViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/24/21.
//

import UIKit
import SwiftSoup



class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
  
    
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var storesCollectionView: UICollectionView!
    
    @IBOutlet var searchQ: UISearchBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var storesImages:[UIImage] = []
    var productsImages:[UIImage] = []
    
   
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == storesCollectionView) {
                return 2 //storesImages.count
            }
            return 5//productsImages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if(collectionView == storesCollectionView) {
           
            let cell = storesCollectionView.dequeueReusableCell(withReuseIdentifier: "storesCell", for: indexPath) as! StoreCollectionViewCell
            let html = try! String(contentsOf: URL(string: "https://www.locally.com/retailers")!)
            
            guard let brands: Elements = try? SwiftSoup.parse(html).getElementsByClass("location-thumb-img") else {return cell}
          
                    
            for brand in 0...(brands.size()/100) {
                print("title" + String(brands.size()))
//                self.productsImages.append(try! brand.ownText())
//                print(try! brand.ownText() + " -image")
                
                guard let url = URL(string: try! brands[brand].attr("src")) else {return cell}
                print("url")
                let data = try? Data(contentsOf: url)
                
                if let imageData = data {
                    storesImages.append( UIImage(data: imageData)! )
                    cell.compstoreImage.image = UIImage(data: imageData)!
                }
                else {
                    productsImages.append(UIImage(named: "pcPic")!)
                }
                
        }
            return cell
        }
        else{
           

            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductCollectionViewCell
            let html = try! String(contentsOf: URL(string: "https://www.locally.com/brands")!)
            
            guard let brands: Elements = try? SwiftSoup.parse(html).getElementsByClass("brand-thumb-img") else {return cell}
          
                    
            for brand in 0...(brands.size()/100) {
                print("title" + String(brands.size()))
//                self.productsImages.append(try! brand.ownText())
//                print(try! brand.ownText() + " -image")
                
                guard let url = URL(string: try! brands[brand].attr("src")) else {return cell}
                print("url")
                let data = try? Data(contentsOf: url)
                
                if let imageData = data {
                    productsImages.append( UIImage(data: imageData)! )
                    cell.pillImage.image = UIImage(data: imageData)!
                }
                else {
                    productsImages.append(UIImage(named: "pcPic")!)
                }
                
            }
         //   cell.pillImage.image = UIImage(named: productsImages[indexPath.row])
            
            return cell
        
    }
    }
    
    
    

    
    
    
    

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
                    if controllers.count == 3 {
                        print("5 - we have 5 controllers")
                        if let resultVC = controllers[1] as? searchViewController {
                            
                            
                            print("6 - got a reference to searchViewController")

                            // if we have not yet selected the 4th tab,
                            //    the view will not yet have been loaded
                            //    so make sure it is
                            resultVC.loadViewIfNeeded()
                            
                            // call the func, passing the button title
                            resultVC.doAthing(searchQ)
                            
                            // switch to the 4th tab
                            tb.selectedIndex = 1

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
    
    @IBAction func clothFilter(_ sender: Any) {
        
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "clothing")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
    
    
    @IBAction func accFilter(_ sender: Any) {
        
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "accessories")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
    
    @IBAction func electronicFilter(_ sender: Any) {
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "electronic")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
    
    @IBAction func pharmacyFilter(_ sender: Any) {
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "pharmacy")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
    
    @IBAction func carFilter(_ sender: Any) {
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "cars")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
    @IBAction func moreFilter(_ sender: Any) {
        if let tb = self.tabBarController {
            print("3 - got a tab bar controller reference")
            if let controllers = tb.viewControllers {
                print("4 - got controllers reference")
                print("4.5 - " + String(controllers.count))
                if controllers.count == 3 {
                    print("5 - we have 5 controllers")
                    if let resultVC = controllers[1] as? searchViewController {
                        
                        
                        print("6 - got a reference to searchViewController")

                        // if we have not yet selected the 4th tab,
                        //    the view will not yet have been loaded
                        //    so make sure it is
                        resultVC.loadViewIfNeeded()
                        
                        // call the func, passing the button title
                        resultVC.doAthingf(filter: "clothing")
                        
                        // switch to the 4th tab
                        tb.selectedIndex = 1

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
   


