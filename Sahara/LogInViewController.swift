//
//  ViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 10/13/21.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
        
        let alert = UIAlertController(title: "Could not Login", message: "Username and/or password is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
    }
    
}

