//
//  Comments.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import Foundation
struct Comments : Codable {
    
    let code : Int?
    let data : [Comment]?
    let meta : Meta?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
        case meta = "meta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        data = try values.decodeIfPresent([Comment].self, forKey: .data)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }
    
}
struct Comment : Codable {
    
    let body : String?
    let createdAt : String?
    let email : String?
    let id : Int?
    let name : String?
    let postId : Int?
    let updatedAt : String?
    
    enum CodingKeys: String, CodingKey {
        case body = "body"
        case createdAt = "created_at"
        case email = "email"
        case id = "id"
        case name = "name"
        case postId = "post_id"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        postId = try values.decodeIfPresent(Int.self, forKey: .postId)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }
    
}
