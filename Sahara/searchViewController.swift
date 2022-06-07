//
//  searchViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 11/3/21.
//

import UIKit
import SwiftSoup

class searchViewController: UIViewController{
   
    

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultsView: UITableView!
    @IBOutlet var searchQuery: UISearchBar!
    
//    let content = try! String(contentsOf: URL(string: "https://www.locally.com/search/all/activities/depts?q=bottle")!)
//    let doc: Document = try! SwiftSoup.parse(content)
    
   
    var ksearchQ:UISearchBar = UISearchBar()
 
    
    var products: [String] = []
    //let products = ["Computer", "PC", "Laptop"]
    let stores = ["Computer Central", "Fry's Electronics", "Best Buy"]
    //var stores: [String] = []
    let into = ["Custom PC with high performanc. Perfect for gaming and streaming. Great condition", "Custom PC with high performanc. Perfect for gaming and streaming. Great condition", "Custom PC with high performanc. Perfect for gaming and streaming. Great condition"]
    var dollars: [String] = []
    //let dollars = [100, 220, 129, 100, 220, 129]
    let likes = [10, 24, 24, 24 , 456, 46, 46]
    //let miles = ["3.2 mi", "4.1 mi", "6.3 mi", "3.2 mi", "4.1 mi", "6.3 mi"]
    var miles: [String] = []
   // let names = ["Central Computers", "CompE", "geekStore", "Central Computers", "CompE", "geekStore"]
    var names: [String] = []
    let numbers = ["510-329-0172", "510-456-7345", "510-329-0172", "510-329-0172", "510-456-7345", "510-329-0172"]
    var images: [UIImage] = []
    var categories: [String] = []
    var descriptions: [String]  = []
    var stars: [String] = []
    var ratings: [Double] = []
    var ratingImage: [[UIImage]] = [[]]
    var phones: [String] = []
    var cities: [String] = []
    
    //var webCounter:Int = 0
   
        
    
    var x:Double = 0
    var y:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        searchQuery.delegate = self
        resultsView.delegate = self
        resultsView.dataSource = self
        
        //set the height of each row in tableview
        self.resultsView.rowHeight = 200.0
        

        // Do any additional setup after loading the view.
    

        
    }
    
    @objc func loadList(notification: NSNotification) {
        //load data here
        self.resultsView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
        if(ksearchQ.text != "")
        {
            ksearchQ.inputViewController?.dismiss(animated: true)
            
           doAthing(ksearchQ)
        
            self.searchQuery.endEditing(true)
            self.resultsView.keyboardDismissMode = .onDrag
            hideKeyboardWhenTappedAround()
        }
        else
        {
            searchBar.inputViewController?.dismiss(animated: true)
            
            doAthing(searchBar)
        
            self.searchQuery.endEditing(true)
            self.resultsView.keyboardDismissMode = .onDrag
            hideKeyboardWhenTappedAround()
        }
            
        
    }
    
        func doAthing(_ searchBar: UISearchBar) {
            
            do {
            
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating();

            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            
                        
            print("reached here")
            let html = try String(contentsOf: URL(string: "https://www.locally.com/search/all/activities/depts?q=" + searchBar.text!)!)
                                  
            //let doc: Document = try SwiftSoup.parse(html)
            guard let titles: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb ") else {return}//select("a") else {return}
            guard let prices: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb-price dl-price") else {return}
            guard let Stores: Elements = try? SwiftSoup.parse(html).getElementsByClass("filter-label-link") else {return}
            guard let Images: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb-img") else {return}
           
            
            
            products = []
            miles = []
            dollars = []
            names = []
            images = []
            stars = []
            
            for title: Element in titles.array() {
                print("title" + String(titles.size()))
                products.append(try! title.attr("data-product-name"))
                
                guard let url: URL = try? URL(string:  "https://www.locally.com/" + String(try! title.attr("href")))
                else
                {
                    miles.append("-")
                    continue
                    
                }
                
                let html1 = try String(contentsOf: url)
                guard let distances: Element = try? SwiftSoup.parse(html1).getElementsByClass("conv-section-distance dl-store-distance").first()
                else
                {
                    miles.append("-")
                    continue
                    
                }
                print(try! distances.ownText())
                miles.append(try! distances.ownText())
                guard let K: Array<String> = try? SwiftSoup.parse(html1).getElementsByClass("breadcrumbs container").eachText() else {return}
                let str = (try! K.last!.components(separatedBy: "/") )
                categories.append(str[str.count - 2])
                print(str[str.count - 2])
                
                guard let desc: Array<String> = try? SwiftSoup.parse(html1).getElementsByClass("pdp-information").eachText() else {return}
                
                guard let s:String = try? desc[1]
                else {
                    return
                }
                descriptions.append( String( s.suffix(s.count - 19) ) )
                print( String( s.suffix(s.count - 19) ) )
                
                guard let star: Element = try? SwiftSoup.parse(html1).getElementsByClass("stars").first()
                else
                {
                    print("no reviews")
                    ratings.append(0)
                    continue
                    
                }
                
                print(try! star.attr("data-rating"))
                //ratings.append(try! star.attr("data-rating")) ?? ()
                
                let x = Double(try! star.attr("data-rating")) ?? 0
                print("y: " + String(Int(x)))
                
                ratings.append(x)
                
                guard let locations: Element = try? SwiftSoup.parse(html1).getElementsByClass("conv-section-store-address section-subtitle dl-store-address js-store-location").first()
                else
                {
                    print("cant find city")
                    return
                }
                
                let string = locations.ownText()
                print("location: " + String(string.prefix(string.count - 10)) )
                cities.append(try! String(string.prefix(string.count - 10)))
                
                
                guard let phoneNums: Element = try? SwiftSoup.parse(html1).getElementsByClass("selected-retailer-info-link btn-action-sm tooltip").first()
                else
                {
                    print("link not found")
                    return
                }
                
                guard let urls:URL = try? URL(string: "https://www.locally.com/" +  phoneNums.attr("href") )
                else
                {
                    return
                }

                let html2 = try String(contentsOf: urls )

                guard let storePage:Element = try? SwiftSoup.parse(html2).getElementsByClass("landing-page-phone-label").first() else {
                    print("Phone Number not found")
                    return
                    
                }
                
                let sp = try? storePage.ownText
                if let s = sp {
                    phones.append(try! s())
                }
                else {
                    phones.append("N/A")
                }

                print(try! storePage.ownText())
//
               // let html1 = try String(contentsOf: url)
                
                
                
                
            }
            for price: Element in prices.array() {
                print("prices" + String(prices.size()))
                print(String(try! price.ownText()))
                dollars.append(try! price.ownText())
            }
            for store: Element in Stores.array() {
                print("Stores" + String(Stores.size()))
                names.append(try! store.ownText()) ?? names.append("N/A")
            }
            for image: Element in Images.array() {
                guard let url = URL(string: try! image.attr("src") ) else { return }
                let data = try? Data(contentsOf: url)
                
                if let imageData = data {
                    images.append( UIImage(data: imageData)! )
                }
                else {
                    images.append(UIImage(named: "pcPic")!)
                }
                //images.append(try! image.downloaded(from: image.attr("src")))
            }
                for _ in ((phones.count)...(names.count))
                {
                    phones.append("N/A")
                }
                for _ in ((ratings.count)...(names.count))
                {
                    ratings.append(0)
                }
                
            dismiss(animated: false, completion: nil)
            resultsView.reloadData()
            
            
           
            
            //let titles: Elements = try doc.select("a[product-thumb]")
            //let titles: String = try doc.select("a").attr("product-thumb")
            
           // print(titles)
            
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        } catch {
            print("")
        }
        }
    
    func doAthingf(filter: String) {
        
        do {
        
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
                    
        print("reached here")
            let html = try String(contentsOf: URL(string: "https://www.locally.com/search/all/activities/" + filter + "?sort=all")!)
                              
        //let doc: Document = try SwiftSoup.parse(html)
        guard let titles: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb ") else {return}//select("a") else {return}
        guard let prices: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb-price dl-price") else {return}
        guard let Stores: Elements = try? SwiftSoup.parse(html).getElementsByClass("filter-label-link") else {return}
        guard let Images: Elements = try? SwiftSoup.parse(html).getElementsByClass("product-thumb-img") else {return}
       
        
        
        products = []
        miles = []
        dollars = []
        names = []
        images = []
        stars = []
        
        for title: Element in titles.array() {
            print("title" + String(titles.size()))
            products.append(try! title.attr("data-product-name"))
            
            guard let url: URL = try? URL(string:  "https://www.locally.com/" + String(try! title.attr("href")))
            else
            {
                miles.append("-")
                continue
                
            }
            
            let html1 = try String(contentsOf: url)
            guard let distances: Element = try? SwiftSoup.parse(html1).getElementsByClass("conv-section-distance dl-store-distance").first()
            else
            {
                miles.append("-")
                continue
                
            }
            print(try! distances.ownText())
            miles.append(try! distances.ownText())
            guard let K: Array<String> = try? SwiftSoup.parse(html1).getElementsByClass("breadcrumbs container").eachText() else {return}
            let str = (try! K.last!.components(separatedBy: "/") )
            if(str[str.count - 2] != nil)
            {
                categories.append(str[str.count - 2])
                print(str[str.count - 2])

            }
            else{
                categories.append("-")
                
            }
            
            guard let desc: Array<String> = try? SwiftSoup.parse(html1).getElementsByClass("pdp-information").eachText() else {return}
            
            guard let s:String = try? desc[1]
            else {
                return
            }
            descriptions.append( String( s.suffix(s.count - 19) ) )
            print( String( s.suffix(s.count - 19) ) )
            
            guard let star: Element = try? SwiftSoup.parse(html1).getElementsByClass("stars").first()
            else
            {
                print("no reviews")
                ratings.append(0)
                continue
                
            }
            
            print(try! star.attr("data-rating"))
            //ratings.append(try! star.attr("data-rating")) ?? ()
            
            let x = Double(try! star.attr("data-rating")) ?? 0
            print("y: " + String(Int(x)))
            
            ratings.append(x)
            
            guard let locations: Element = try? SwiftSoup.parse(html1).getElementsByClass("conv-section-store-address section-subtitle dl-store-address js-store-location").first()
            else
            {
                print("cant find city")
                return
            }
            
            let string = locations.ownText()
            print("location: " + String(string.prefix(string.count - 10)) )
            cities.append(try! String(string.prefix(string.count - 10)))
            
            
            guard let phoneNums: Element = try? SwiftSoup.parse(html1).getElementsByClass("selected-retailer-info-link btn-action-sm tooltip").first()
            else
            {
                print("link not found")
                return
            }
            
            guard let urls:URL = try? URL(string: "https://www.locally.com/" +  phoneNums.attr("href") )
            else
            {
                return
            }

            let html2 = try String(contentsOf: urls )

            guard let storePage:Element = try? SwiftSoup.parse(html2).getElementsByClass("landing-page-phone-label").first() else {
                print("Phone Number not found")
                return
                
            }
            
            let sp = try? storePage.ownText
            if let s = sp {
                phones.append(try! s())
            }
            else {
                phones.append("N/A")
            }

            print(try! storePage.ownText())
//
           // let html1 = try String(contentsOf: url)
            
            
            
            
        }
        for price: Element in prices.array() {
            print("prices" + String(prices.size()))
            print(String(try! price.ownText()))
            dollars.append(try! price.ownText())
        }
        for store: Element in Stores.array() {
            print("Stores" + String(Stores.size()))
            names.append(try! store.ownText()) ?? names.append("N/A")
        }
        for image: Element in Images.array() {
            guard let url = URL(string: try! image.attr("src") ) else { return }
            let data = try? Data(contentsOf: url)
            
            if let imageData = data {
                images.append( UIImage(data: imageData)! )
            }
            else {
                images.append(UIImage(named: "pcPic")!)
            }
            //images.append(try! image.downloaded(from: image.attr("src")))
        }
            for _ in ((phones.count)...(names.count))
            {
                phones.append("N/A")
            }
            for _ in ((ratings.count)...(names.count))
            {
                ratings.append(0)
            }
            
        dismiss(animated: false, completion: nil)
        resultsView.reloadData()
        
        
       
        
        //let titles: Elements = try doc.select("a[product-thumb]")
        //let titles: String = try doc.select("a").attr("product-thumb")
        
       // print(titles)
        
    } catch Exception.Error(type: let type, Message: let message) {
        print(type)
        print(message)
    } catch {
        print("")
    }
    }
    
    
    

    
   
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.tabBar.isHidden = false
//    }
    
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


extension searchViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("reached here")
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
            cell.productImage?.image = images[indexPath.row]
           // cell.descriptionLabel?.text = into[indexPath.row]
           // cell.descriptionLabel?.numberOfLines = 0
            cell.price?.text = String(dollars[indexPath.row])
            cell.distance?.text = miles[indexPath.row]
            cell.storeName?.numberOfLines = 0
            cell.storeName?.text = names[indexPath.row]
            cell.phoneNumber?.text = phones[indexPath.row]
            let ratNumber = ratings[indexPath.row]
            if( ratNumber == 0 )
            {
                cell.rating?.text = "No Reviews"
            }
            else
            {
                cell.rating?.text = String(ratNumber)
            }
            
            if(ratNumber > 4.5)
            {
                cell.star1.image = UIImage(named: "regular_5")
            }
            else if(ratNumber > 4.0)
            {
                cell.star1.image = UIImage(named: "regular_4_half")
            }
            else if(ratNumber == 4.0)
            {
                cell.star1.image = UIImage(named: "regular_4")
            }
            else if(ratNumber > 3.0)
            {
                cell.star1.image = UIImage(named: "regular_3_half")
            }
            else if(ratNumber == 3.0)
            {
                cell.star1.image = UIImage(named: "regular_3")
            }
            else if(ratNumber > 2.0)
            {
                cell.star1.image = UIImage(named: "regular_2_half")
            }
            else if(ratNumber == 2.0)
            {
                cell.star1.image = UIImage(named: "regular_2")
            }
            else if(ratNumber > 1.0)
            {
                cell.star1.image = UIImage(named: "regular_1_half")
            }
            else if(ratNumber == 1.0)
            {
                cell.star1.image = UIImage(named: "regular_1")
            }
            else
            {
                cell.star1.image = UIImage(named: "regular_0")
            }
            
            cell.rating?.numberOfLines = 0
            
           
           
           // cell.phoneNumber?.text = numbers[indexPath.row]
        case 1:
            cell.titleLabel?.text = stores[indexPath.row]
            cell.productImage?.image = imageWithImage(image: UIImage.init(named: "pcPic")!, scaledToSize: CGSize(width: 400, height: 300))
           // cell.descriptionLabel?.text = into[indexPath.row]
           // cell.descriptionLabel?.numberOfLines = 0
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
         //   cell.descriptionLabel?.text = alls[indexPath.row]
          //  cell.descriptionLabel?.numberOfLines = 0
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
       // destinationVC.kdescription = [indexPath.row]
        destinationVC.kimage = images[indexPath.row]
//        destinationVC.klikes = likes[indexPath.row]
        destinationVC.kcategory = categories[indexPath.row]
        destinationVC.kdescription = descriptions[indexPath.row]
        destinationVC.kname = names[indexPath.row]
        destinationVC.kmiles = miles[indexPath.row]
        destinationVC.klocation = cities[indexPath.row]
        
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    
}


extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
 }
        
    
        


