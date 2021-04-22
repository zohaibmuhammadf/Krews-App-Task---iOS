//
//  ViewModelViewController.swift
//  KrewsTask
//
//  Created by eapple on 4/20/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class PostsViewModel: NSObject {
    weak var vc: ViewController?
    private(set) var posts : Posts! {
        didSet {
            self.bindPostsViewModelToController()
        }
    }
    var bindPostsViewModelToController : (() -> ()) = {}
    func fetchPosts(){
        Webservice.shared.fetchPosts(Constants.postsApiUrl) { [weak self] (posts, error) in
            if error != nil {
                // show alert
            } else {
                self?.posts = posts
            }
        }
    }
    func navigateToProfileScreen(){
        guard let vc = vc else { return}
        guard let userID = posts?.data?[0].userId else {return}
        let profileVC = vc.storyboard?.instantiateViewController(identifier: "UserProfileViewController") as! UserProfileViewController
        profileVC.userID = userID
        vc.navigationController?.pushViewController(profileVC, animated: true)
    }
    func navigateToCommentsScreen(){
        guard let vc = vc else { return}
        let profileVC = vc.storyboard?.instantiateViewController(identifier: "CommentsViewController") as! CommentsViewController
        vc.navigationController?.pushViewController(profileVC, animated: true)
    }
}

// MARK:- TableView Datasource and Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postListTB.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        cell.titleLbl.text = viewModel.posts?.data?[indexPath.row].title ?? ""
        cell.bodyLbl.text = viewModel.posts?.data?[indexPath.row].body ?? ""
        cell.profileBtn.tag = indexPath.row
        cell.commentsBtn.tag = indexPath.row
        cell.profileBtn.addTarget(self, action: #selector(navigateProfileScreen), for: .touchUpInside)
        cell.commentsBtn.addTarget(self, action: #selector(navigateCommentsScreen), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    @objc func navigateProfileScreen(_ sender: UIButton){
        viewModel.navigateToProfileScreen()
    }
    @objc func navigateCommentsScreen(_ sender: UIButton){
        viewModel.navigateToCommentsScreen()
    }
}
