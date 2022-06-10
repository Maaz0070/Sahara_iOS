//
//  ViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/13/21.
//

import UIKit

class LogInViewController: UIViewController {
    
    var kusername:String = ""
    var kpassword:String = ""

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    @IBAction func onLogin(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
        
        if(username == kusername && password == kpassword)
        {
//            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//
//            self.navigationController?.pushViewController(secondViewController, animated: true)
            
            self.performSegue(withIdentifier: "seg", sender: nil)
            print("fail")
        }
        else
        {
            let alert = UIAlertController(title: "Could not Login", message: "Username and/or password is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            print("fail1")
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

