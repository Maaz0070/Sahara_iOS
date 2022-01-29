//
//  searchViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 11/3/21.
//

import UIKit

class searchViewController: UIViewController {
   
    

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultsView: UITableView!
    
    let products = ["Computer", "PC", "Laptop"]
    let stores = ["Computer Central", "Fry's Electronics", "Best Buy"]
    let into = ["Custom PC with high performanc. Perfect for gaming and streaming. Great condition", "Custom PC with high performanc. Perfect for gaming and streaming. Great condition", "Custom PC with high performanc. Perfect for gaming and streaming. Great condition"]
    let dollars = [100, 220, 129, 100, 220, 129]
    let likes = [10, 24, 24, 24 , 456, 46, 46]
    let miles = ["3.2 mi", "4.1 mi", "6.3 mi", "3.2 mi", "4.1 mi", "6.3 mi"]
    let names = ["Central Computers", "CompE", "geekStore", "Central Computers", "CompE", "geekStore"]
    let numbers = ["510-329-0172", "510-456-7345", "510-329-0172", "510-329-0172", "510-456-7345", "510-329-0172"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsView.delegate = self
        resultsView.dataSource = self
        //set the height of each row in tableview
        self.resultsView.rowHeight = 200.0

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //When user changes segment, tableview is reloaded
    @IBAction func segmentChanged(_ sender: Any) {
        resultsView.reloadData();
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0 ,y: 20 ,width: newSize.width ,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.alwaysOriginal)
    }
    
}

extension searchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return products.count
        case 1:
            return stores.count
        case 2:
            return (products.count + stores.count)
        default:
            break
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsTableViewCell") as! resultsTableViewCell
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.titleLabel?.text = products[indexPath.row]
            cell.productImage?.image = imageWithImage(image: UIImage.init(named: "pcPic")!, scaledToSize: CGSize(width: 400, height: 300))
            cell.descriptionLabel?.text = into[indexPath.row]
            cell.descriptionLabel?.numberOfLines = 0
            cell.price?.text = String(dollars[indexPath.row])
            cell.distance?.text = miles[indexPath.row]
            cell.storeName?.text = names[indexPath.row]
            cell.phoneNumber?.text = numbers[indexPath.row]
        case 1:
            cell.titleLabel?.text = stores[indexPath.row]
            cell.productImage?.image = imageWithImage(image: UIImage.init(named: "pcPic")!, scaledToSize: CGSize(width: 400, height: 300))
            cell.descriptionLabel?.text = into[indexPath.row]
            cell.descriptionLabel?.numberOfLines = 0
            cell.price?.text = String(dollars[indexPath.row])
            cell.distance?.text = miles[indexPath.row]
            cell.storeName?.text = names[indexPath.row]
            cell.phoneNumber?.text = numbers[indexPath.row]
            
        case 2:
            var all = products + stores
            all.shuffle()
            let alls = into + into
            cell.titleLabel?.text = all[indexPath.row]
            cell.productImage?.image = imageWithImage(image: UIImage.init(named: "pcPic")!, scaledToSize: CGSize(width: 400, height: 300))
            cell.descriptionLabel?.text = alls[indexPath.row]
            cell.descriptionLabel?.numberOfLines = 0
            cell.price?.text = String(dollars[indexPath.row])
            cell.distance?.text = miles[indexPath.row]
            cell.storeName?.text = names[indexPath.row]
            cell.phoneNumber?.text = numbers[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
//            self.present(vc, animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        destinationVC.ktitle = products[indexPath.row]
        destinationVC.kprice = dollars[indexPath.row]
        destinationVC.kdescription = into[indexPath.row]
        destinationVC.kimage = UIImage(named: "pcPic")!
        destinationVC.klikes = likes[indexPath.row]
        
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    
}
