//
//  SocialViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 11/26/21.
//

import UIKit

struct HomeFeedRenderViewModel {
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

class SocialViewController: UIViewController{
    
    
   
  //  @IBOutlet var table: UITableView!
    
    private var feedRenderModels = [HomeFeedRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SocialTableViewCell.self, forCellReuseIdentifier: SocialTableViewCell.identifier)
        tableView.register(SocialFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: SocialFeedPostHeaderTableViewCell.identifier)
        tableView.register(SocialFeedPostActionTableViewCell.self, forCellReuseIdentifier: SocialFeedPostActionTableViewCell.identifier)
        tableView.register(SocialFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: SocialFeedPostGeneralTableViewCell.identifier)
        return tableView
    }()
    
   // var models = [InstagramPost]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createMockModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func createMockModels() {
        
        let user = User(username: "@CompE",
                        bio: "",
                        name: (first: "", last: ""),
                        profilePhoto: URL(string: "https://www.google.com")!,
                        birthDate: Date(),
                        gender: .male,
                        counts: UserCount(followers: 1, following: 1, posts: 1),
                        joinDate: Date(),
                        password: "")
        
        let post = UserPost(identifier: "",
                            postType: .photo,
                            thumbnailImage: URL(string: "https://www.google.com/")!,
                            caption: nil,
                            likeCount: [],
                            comments: [],
                            createdDate: Date(),
                            taggedUsers: [],
                            postURL: URL(string: "https://www.google.com/")!,
                            title: "",
                            owner: user)
        
        
        var comments = [PostComment]()
        for x in 0..<2 {
            comments.append(
                PostComment(identifier: "\(x)",
                            username: "@jenny",
                            text: "This is the best post I've seen",
                            createdDate: Date(),
                            likes: []
                           )
            )
        }
        
        for x in 0..<5 {
            let viewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)),
                                                    post: PostRenderViewModel(renderType: .primaryContent(provider: post)),
                                                    actions: PostRenderViewModel(renderType: .actions(provider: "")) ,
                                                    comments: PostRenderViewModel(renderType: .comments(comments: comments ))
            )
            feedRenderModels.append(viewModel)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    /*
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
     */

}
/*
struct InstagramPost {
    let numberOfLikes: Int
    let username: String
    let userImageName: String
    let postImageName: String
}
*/

extension SocialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedRenderModels.count * 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let x = section
        let model: HomeFeedRenderViewModel
        if x == 0 {
            model = feedRenderModels[0]
        }
        else {
            let position = x%4 == 0 ? x/4 : ( (x-(x%4) ) / 4)
            model = feedRenderModels[position]
        }
        
        let subSection = x % 4
        
        if subSection == 0 {
            //header
            return 1
        }
        else if subSection == 1 {
            //post
            return 1
        }
        else if subSection == 2 {
            //actions
            return 1
        }
        else if subSection == 3 {
            //comments
            let commentsModel = model.comments
            switch commentsModel.renderType {
            case .comments(let comments): return comments.count > 2 ? 2 : comments.count
            case .header, .actions, .primaryContent: return 0
            //@unknown default: fatalError("Invalid case")
            }
        }
        
        return 0
            
//        switch renderModels[section].renderType {
//        case .actions(_): return 1
//        case .comments(let comments): comments.count > 4 ? 4 : comments.count
//        case .primaryContent(_): return 1
//        case .header(_): return 1
       // }
       // return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let model = renderModels[indexPath.section]
        
        let x = indexPath.section
        let model: HomeFeedRenderViewModel
        if x == 0 {
            model = feedRenderModels[0]
        }
        else {
            let position = x%4 == 0 ? x/4 : ((x-(x%4)) / 4)
            model = feedRenderModels[position]
        }
        
        let subSection = x % 4
        
        if subSection == 0 {
            //header
           // let headerModel = model.header
            switch model.header.renderType {
            case .header(let user):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostHeaderTableViewCell.identifier, for: indexPath) as! SocialFeedPostHeaderTableViewCell
                cell.configure(with: user)
                cell.delegate = self
                return cell
            case .comments, .actions, .primaryContent: return UITableViewCell()
            }
        }
        else if subSection == 1 {
            //post
          //  let postModel = model.post
            switch model.post.renderType {
            case .primaryContent(let post):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialTableViewCell.identifier, for: indexPath) as! SocialTableViewCell
                cell.configure(with: post)
                return cell
                
            case .comments, .actions, .header: return UITableViewCell()
            }
        }
        else if subSection == 2 {
            //actions
          //  let actionModel = model.actions
            switch model.actions.renderType {
            case .actions(let provider):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostActionTableViewCell.identifier, for: indexPath) as! SocialFeedPostActionTableViewCell
                cell.delegate = self
                return cell
            case .comments, .header, .primaryContent: return UITableViewCell()
            }
                    
        }
        else if subSection == 3 {
            //comments
          //  let commentModel = model.comments
            switch model.comments.renderType {
            case .comments(let comments):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostGeneralTableViewCell.identifier, for: indexPath) as! SocialFeedPostGeneralTableViewCell
                return cell
            case .header, .actions, .primaryContent: return UITableViewCell()
            }
        }
        
        return UITableViewCell()
        
//        switch model.renderType {
//            case .actions(let actions):
////                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostActionTableViewCell.identifier, for: indexPath) as! SocialFeedPostActionTableViewCell
////                return cell
//
//            case .comments(let comments):
//                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostGeneralTableViewCell.identifier, for: indexPath) as! SocialFeedPostGeneralTableViewCell
//                return cell
            
//        case .primaryContent(let post):
////                let cell = tableView.dequeueReusableCell(withIdentifier: SocialTableViewCell.identifier, for: indexPath) as! SocialTableViewCell
////                return cell
//
//        case .header(let user):
//                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostHeaderTableViewCell.identifier, for: indexPath) as! SocialFeedPostHeaderTableViewCell
//                return cell
//
        //}
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       // let x = indexPath.section
        
        let subSection = indexPath.section % 4
        
        if subSection == 0 {
            //header
            return 70
        }
        else if subSection == 1 {
            //Post
            print(tableView.bounds.height)
            return tableView.bounds.height - 610
            
            //return 400
        }
        else if subSection == 2 {
            //Actions(like/comment)
            return 60
        }
        else if subSection == 3 {
            //Comment Row
            return 50
        }
        
            return 0
        
        
//        let model = renderModels[indexPath.section]
//        switch model.renderType {
//        case .actions(_): return 60
//        case .comments(_): return 50
//        case .primaryContent(_): return
//        case .header(_): return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        
        let subSection = section % 4
        return subSection == 3 ? 70 : 0
        
        return 0
    }
    


    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SocialTableViewCell.identifier, for: indexPath) as! SocialTableViewCell
        
        return cell
    }
     */
}

extension SocialViewController: SocialFeedPostHeaderTableViewCellDelegate {
    func didTapMoreButton() {
        let actionSheet = UIAlertController(title: "Post Options", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Report Post", style: .destructive, handler: { [weak self] _ in
            self?.reportPost()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    func reportPost() {
        
    }
}

extension SocialViewController: SocialFeedPostActionTableViewCellDelegate {
    func didTapLikeButton() {
        print("like")
    }
    
    func didTapCommentButton() {
        print("comment")
    }
    
    func didTapSendButton() {
        print("send")
    }
    
    
}
