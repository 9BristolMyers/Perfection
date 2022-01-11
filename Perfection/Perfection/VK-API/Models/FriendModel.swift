//
//  FriendModel.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import SwiftyJSON
import RealmSwift

class FriendModel: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var trackCode, firstName: String
    @objc dynamic var photo100: String
    
    init (id: Int) {
    
        self.id = 0
        self.lastName = ""
        self.trackCode = ""
        self.firstName = ""
        self.photo100 = ""
    }
    
    var fullName: String {
        
        firstName + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
