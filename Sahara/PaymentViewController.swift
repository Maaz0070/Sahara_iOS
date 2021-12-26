//
//  PaymentViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 12/25/21.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBAction func didTapSegmentedControl(_ sender: Any) {
    }
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func didPressCashButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
            self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didPressPayPalButton(_ sender: Any) {
    }
    @IBAction func didPressBitcoinButton(_ sender: Any) {
    }
    @IBAction func didPressDogecoinButton(_ sender: Any) {
    }
    @IBAction func didPressCardButton(_ sender: Any) {
    }
    
    
    
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
