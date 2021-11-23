//
//  Friend3.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct FriendsJSON: Codable {
    
    let response: Response
}

struct Response: Codable {
    
    let count: Int
    let items: [Item]
}

class Friend3: Object, Codable {
    
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    @objc dynamic var trackCode, firstName: String
    @objc dynamic var photo100: String
    @objc dynamic var deactivated: String?
    
    var fullName: String {
        firstName + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
        case deactivated
    }
}
