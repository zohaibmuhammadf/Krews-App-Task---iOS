//
//  ViewController.swift
//  KrewsTask
//
//  Created by eapple on 4/20/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var postListTB: UITableView!
    let viewModel = PostsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
        viewModel.fetchPosts()
        updateUI()
    }
    func updateUI(){
        viewModel.bindPostsViewModelToController = { [weak self] in
            DispatchQueue.main.async {
                self?.postListTB.reloadData()
            }
        }
    }
}
