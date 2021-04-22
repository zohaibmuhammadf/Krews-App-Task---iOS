//
//  Profile.swift
//  KrewsTask
//
//  Created by eapple on 4/21/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import Foundation
struct UserProfile : Codable {
    let code : Int?
    let data : [UserInfo]?
    let meta : Meta?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
        case meta = "meta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        data = try values.decodeIfPresent([UserInfo].self, forKey: .data)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }
    
}

struct UserInfo : Codable {
    
    let createdAt : String?
    let email : String?
    let gender : String?
    let id : Int?
    let name : String?
    let status : String?
    let updatedAt : String?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case email = "email"
        case gender = "gender"
        case id = "id"
        case name = "name"
        case status = "status"
        case updatedAt = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
    }
    
}

