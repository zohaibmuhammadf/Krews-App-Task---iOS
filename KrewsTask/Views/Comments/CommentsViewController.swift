//
//  CommentsViewController.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    let viewModel = CommentsViewModel()
    @IBOutlet weak var tbleView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
        viewModel.fetchComments()
        updateUI()
    }
    func updateUI(){
        viewModel.bindCommentsViewModelToController = { [weak self] in
            DispatchQueue.main.async {
                self?.tbleView.reloadData()
            }
        }
    }
}
