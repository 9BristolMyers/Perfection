//
//  Photo.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import RealmSwift

class PhotoModel: Object, Codable {
    
    @objc dynamic var postID: Int
    @objc dynamic var id: Int = 0
    @objc dynamic var date: Int = 0
    @objc dynamic var text: String = ""
    
    @objc dynamic var assetUrl: String = ""
    
    let reposts: Reposts
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let likes: Likes
    let albumID: Int
    
    let photoUrl: String {
        guard let size = sizes.last else { return "" }
        return size.url
    }
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case reposts
        case postID = "post_id"
        case id, text, date, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case likes
    }
}

struct Likes: Codable {
    let userLikes, count: Int
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

struct Reposts: Codable {
    let count: Int
}
