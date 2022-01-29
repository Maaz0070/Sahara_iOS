//
//  CashViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 1/10/22.
//

import UIKit

class CashViewController: UIViewController {

    @IBAction func done(_ sender: Any) {
        //Update firebase sold value to 1
        //send confirmation to seller
        //TODO
        
        
        //if seller confirms cash transcation send confirmation notification to both parties and add to history of both customers
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
