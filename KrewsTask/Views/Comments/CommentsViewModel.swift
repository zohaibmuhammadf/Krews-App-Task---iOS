//
//  CommentsViewModel.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class CommentsViewModel: NSObject {
    var bindCommentsViewModelToController : (() -> ()) = {}
    weak var vc: CommentsViewController?
    private(set) var comments : Comments? {
        didSet {
            self.bindCommentsViewModelToController()
        }
    }
    func fetchComments(){
        Webservice.shared.fetchComments(Constants.commentsUrl) { [weak self] (comments, error) in
            if error != nil {
                // show alert
            } else {
                self?.comments = comments
            }
        }
    }
    func resizeHeight(_ indexPath: IndexPath) -> CGFloat {
        let height:CGFloat = CGFloat(60)
        let msg = (comments?.data?[indexPath.row].name ?? "") + ":- " + (comments?.data?[indexPath.row].body ?? "")
        let temp = Double(msg.count) / Double(100)
        let tempInt = Int(ceil(temp))
        return 16 * CGFloat(tempInt) + height
    }
}

// MARK: TableView Delegates & Datasource CommentsViewCOntroller
extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbleView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        cell.commentsLbl.text = (viewModel.comments?.data?[indexPath.row].name ?? "") + ":- " + (viewModel.comments?.data?[indexPath.row].body ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.resizeHeight(indexPath)
    }
}
