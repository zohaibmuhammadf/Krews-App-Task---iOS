//
//  ProfileViewModel.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class ProfileViewModel: NSObject {
    weak var vc: UserProfileViewController?
    private(set) var userProfile : UserProfile! {
        didSet {
            self.bindProfileViewModelToController()
        }
    }
    var bindProfileViewModelToController : (() -> ()) = {}
    
    func fetchUserProfile(){
        guard let vc = vc else { return}
        guard let userID = vc.userID else { return}
        Webservice.shared.fetchUserProfile(Constants.userProfileUrl+"user_id=\(userID)") { [weak self] (userProfile, error) in
            if error != nil {
                // show alert
            } else {
                self?.userProfile = userProfile
            }
        }
    }
}
