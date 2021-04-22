//
//  Posts.swift
//  KrewsTask
//
//  Created by eapple on 4/20/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import Foundation
struct Posts : Codable {
    let code : Int?
    var data : [PostsData]?
    let meta : Meta?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
        case meta = "meta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        data = try values.decodeIfPresent([PostsData].self, forKey: .data)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }
    
}
struct Meta : Codable {
    
    let pagination : Pagination?
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }
    
}
struct Pagination : Codable {
    
    let limit : Int?
    let page : Int?
    let pages : Int?
    let total : Int?
    
    enum CodingKeys: String, CodingKey {
        case limit = "limit"
        case page = "page"
        case pages = "pages"
        case total = "total"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }
    
}
struct PostsData : Codable {
    
    let body : String?
    let createdAt : String?
    let id : Int?
    let title : String?
    let updatedAt : String?
    let userId : Int?
    
    enum CodingKeys: String, CodingKey {
        case body = "body"
        case createdAt = "created_at"
        case id = "id"
        case title = "title"
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }
    
}
