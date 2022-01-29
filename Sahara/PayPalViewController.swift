//
//  PayPalViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 1/12/22.
//

/*
 Sandbox Account: sb-vpgk611315886@business.example.com
 Client ID: AYKfQL1xDqRQp6gsQHy74KA_iZ3ubt0rq-D-Vt4qyQre2C6KSpE9XxYT_Vu_a5f2qzDFURUaIgtea_8B
 Secret: EF4Jy202J_K3G84GWs5UC-6R-leEx-o20XfG8QkorPOuMYBKsRk39I2sZXfeua9GCiCf01lzqQeXYTfn
 
    Tokenization Key: sandbox_kth4vmgy_hh6cdfwdth2sbr4v
 */

import UIKit
//import Braintree

class PayPalViewController: UIViewController {
    
    
   // var braintreeClient: BTAPIClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // self.braintreeClient = BTAPIClient(authorization: "sandbox_kth4vmgy_hh6cdfwdth2sbr4v")
        
        
        
    
    
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
   /*
    @IBAction func pay(_ sender: Any) {
        let payPalDriver = BTPayPalDriver(apiClient: self.braintreeClient)
         //BTViewControllerPresentingDelegate = self
        
        let request = BTPayPalCheckoutRequest(amount: "2.32")//amount: "2.32")
        request.currencyCode = "USD"

        payPalDriver.requestOneTimePayment(request as! BTPayPalCheckoutRequest) { (tokenizedPayPalAccount, error) in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")

                // Access additional information
                let email = tokenizedPayPalAccount.email
                let firstName = tokenizedPayPalAccount.firstName
                let lastName = tokenizedPayPalAccount.lastName
                let phone = tokenizedPayPalAccount.phone

                // See BTPostalAddress.h for details
                let billingAddress = tokenizedPayPalAccount.billingAddress
                let shippingAddress = tokenizedPayPalAccount.shippingAddress
            } else if let error = error {
                // Handle error here...
                print("error")
            } else {
                // Buyer canceled payment approval
            }
        }
        
    }
    */
    }
    
    
/*
extension PayPalViewController: BTViewControllerPresentingDelegate {
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        
    }
    
    
}

extension PayPalViewController: BTAppContextSwitchDriver {
    static func canHandleReturnURL(_ url: URL) -> Bool {
        return true
        
    }
    
    static func handleReturnURL(_ url: URL) {
        
    }
    
    
    
    }

*/
