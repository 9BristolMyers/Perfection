//
//  Friend2.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Friend2: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo100: String = ""
    
    var fullName: String {
        firstName + lastName
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.firstName = json["first_name"].string ?? ""
        self.lastName = json["last_name"].string ?? ""
        self.photo100 = json["photo_100"].string ?? ""
    }
}
