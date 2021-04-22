//
//  Constants.swift
//  KrewsTask
//
//  Created by eapple on 4/20/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import Foundation
struct Constants {
    
    // TODO:- separate the base URL
    struct Urls {
        static let postsApiUrl = "https://gorest.co.in/public-api/posts"
        static let userProfileUrl = "https://gorest.co.in/public-api/users?"
        static let commentsUrl = "https://gorest.co.in/public-api/comments"
    }
    
    struct CellIdentifiers {
        static let postsTableViewCell = "PostsTableViewCell"
        static let commentsTableViewCell = "CommentsTableViewCell"
    }
    
    struct VCIdentifiers {
        static let userProfileVC = "UserProfileViewController"
        static let commentsVC = "CommentsViewController"
    }
}

