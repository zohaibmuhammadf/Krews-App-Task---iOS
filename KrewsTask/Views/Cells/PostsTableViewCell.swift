//
//  PostsTableViewCell.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var commentsBtn: UIButton!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var bodyLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
