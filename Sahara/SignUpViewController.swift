//
//  SignUpViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/15/21.
//

import UIKit

class SignUpViewController: UIViewController {


    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUp(_ sender: Any) {
        let username = username.text!
        let email = email.text!
        let password = password.text!
        
//        let userC = UserCount.init(followers: 0, following: 0, posts: 0)
//        let d = Date()
//        let u = (URL(string: "https://www.google.com/") ?? URL(string: ""))!
//            
//        User.init(username: username, bio: "N/A", name: ("N/A", "N/A"), profilePhoto: u, birthDate: Date(), gender: Gender.male, counts: userC, joinDate: Date(), password: password)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        destinationVC.kusername = username
        destinationVC.kpassword = password

        self.navigationController?.pushViewController(destinationVC, animated: true)
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
