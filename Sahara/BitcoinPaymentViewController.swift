//
//  BitcoinPaymentViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 12/26/21.
//

import UIKit
import RxSwift
import Hodler
import BitcoinCore
import BitcoinKit


class BitcoinPaymentViewController: UIViewController {

    @IBOutlet var walletAddress: UITextField!
    @IBOutlet var walletPhrase: UITextField!
    @IBOutlet var amount: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func send(_ sender: Any) {
        let words = walletPhrase.text!.components(separatedBy: " ")
        
        
        do {
            let bitcoinKit = try BitcoinKit(withWords: words, bip: Bip.bip44 , walletId: "2378346562837234656823746", syncMode: .api, networkType: .mainNet, confirmationsThreshold: 6, logger: nil)
            bitcoinKit.start()
            print(bitcoinKit.balance)
            try bitcoinKit.send(to: walletAddress.text!, value: Int(amount.text!) ?? 0, feeRate: 34, sortType: TransactionDataSortType.bip69)
        } catch {
            print("error")
            let alert = UIAlertController(title: "Error", message: "Failed to send Bitcoin", preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
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
