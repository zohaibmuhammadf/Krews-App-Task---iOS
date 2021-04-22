//
//  UserProfileViewController.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userProfileImgView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    var userID:Int!
    let viewModel = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vc = self
        viewModel.fetchUserProfile()
        updateUI()
    }
    // fetched 0 index object as api response was not correct. Api should return single user detail
    func updateUI(){
        viewModel.bindProfileViewModelToController = { [weak self] in
            DispatchQueue.main.async {
                self?.userNameLbl.text = self?.viewModel.userProfile.data?[0].name ?? ""
                self?.genderLbl.text = self?.viewModel.userProfile.data?[0].gender ?? ""
                self?.statusLbl.text = "(\(self?.viewModel.userProfile.data?[0].status ?? ""))"
                self?.emailLbl.text = self?.viewModel.userProfile.data?[0].email ?? ""
            }
        }
    }
    
    @IBAction func updateProfileBtn(_ sender: UIButton) {
    }
}
