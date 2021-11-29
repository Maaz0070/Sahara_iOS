//
//  SocialViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 11/26/21.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet var table: UITableView!
    
    var models = [InstagramPost]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(InstagramPost(numberOfLikes: 200,
                                    username: "maaz_007",
                                    userImageName: "profileIcon",
                                    postImageName: "pcPic") )
        
        models.append(InstagramPost(numberOfLikes: 200,
                                    username: "CompE",
                                    userImageName: "profileIcon",
                                    postImageName: "pcPic") )
        
        models.append(InstagramPost(numberOfLikes: 200,
                                    username: "anaik343",
                                    userImageName: "profileIcon",
                                    postImageName: "pcPic") )

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30 + 35 + (view.frame.size.width)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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

struct InstagramPost {
    let numberOfLikes: Int
    let username: String
    let userImageName: String
    let postImageName: String
}
