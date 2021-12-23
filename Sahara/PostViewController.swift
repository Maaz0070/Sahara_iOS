//
//  PostViewController.swift
//  Sahara
//
//  Created by Maaz Adil on 12/2/21.
//

import UIKit

/// States of a rendered cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost)
    case actions(provider: String)  //like, commnet, share
    case comments(comments: [PostComment])
}

struct PostRenderViewModel {
    let renderType: PostRenderType
}

class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        //Register Cells
        tableView.register(SocialTableViewCell.self, forCellReuseIdentifier: SocialTableViewCell.identifier)
        tableView.register(SocialFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: SocialFeedPostHeaderTableViewCell.identifier)
        tableView.register(SocialFeedPostActionTableViewCell.self, forCellReuseIdentifier: SocialFeedPostActionTableViewCell.identifier)
        tableView.register(SocialFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: SocialFeedPostGeneralTableViewCell.identifier)
        
        
        return tableView
    }()
    
    init(model: UserPost){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureModels() {
        guard let userPostModel = self.model else {
            return
        }
        //Header
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        
        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        
        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
        
        
        //4 Comments
        var comments = [PostComment]()
        for x in 0..<4 {
            comments.append(
            PostComment(
                identifier: "123_\(x)",
                username: "@dave",
                text: "Great post!",
                createdDate: Date(),
                likes: []
                       )
        )
    }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments) ))
    }
                                                
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType {
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 4 ? 4 : comments.count
        case .primaryContent(_): return 1
        case .header(_): return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        
        switch model.renderType {
            case .actions(let actions):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostActionTableViewCell.identifier, for: indexPath) as! SocialFeedPostActionTableViewCell
                return cell
            
            case .comments(let comments):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostGeneralTableViewCell.identifier, for: indexPath) as! SocialFeedPostGeneralTableViewCell
                return cell
            
        case .primaryContent(let post):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialTableViewCell.identifier, for: indexPath) as! SocialTableViewCell
                return cell
            
        case .header(let user):
                let cell = tableView.dequeueReusableCell(withIdentifier: SocialFeedPostHeaderTableViewCell.identifier, for: indexPath) as! SocialFeedPostHeaderTableViewCell
                return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        switch model.renderType {
        case .actions(_): return 60
        case .comments(_): return 50
        case .primaryContent(_): return 200
        case .header(_): return 70
    }
    
}
    
}
