//
//  Webservice.swift
//  KrewsTask
//
//  Created by eapple on 4/20/21.
//  Copyright © 2021 ZK. All rights reserved.
//

import Foundation
class Webservice: NSObject {
    static let shared = Webservice()
    func fetchPosts(_ url: String, completion:@escaping (Posts?, Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(response as Any)
            if error != nil {
                completion(nil, error)
                return
            }
            do {
                let posts = try JSONDecoder().decode(Posts.self, from: data! )
                completion(posts, nil)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completion(nil, error)
            }
        })
        task.resume()
    }
    func fetchUserProfile(_ url: String, completion:@escaping (UserProfile?, Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(response as Any)
            if error != nil {
                completion(nil, error)
                return
            }
            do {
                let userProfile = try JSONDecoder().decode(UserProfile.self, from: data! )
                completion(userProfile, nil)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completion(nil, error)
            }
        })
        task.resume()
    }
    func fetchComments(_ url: String, completion:@escaping (Comments?, Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(response as Any)
            if error != nil {
                completion(nil, error)
                return
            }
            do {
                let comments = try JSONDecoder().decode(Comments.self, from: data! )
                completion(comments, nil)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
                completion(nil, error)
            }
        })
        task.resume()
    }
}
